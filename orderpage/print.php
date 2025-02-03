<?php
require('fpdf/fpdf.php'); 
$con = mysqli_connect("localhost", "root", "", "gestion");

if (!$con) {
    die("Connection failed: " . mysqli_connect_error());
}

$invoice_id = $_GET['id'];

$query = "SELECT * FROM client_1
          JOIN serveur ON client_1.id = serveur.id
          JOIN `table` ON client_1.id = `table`.id
          JOIN command ON client_1.id = command.id
          WHERE client_1.id = $invoice_id";

$result = mysqli_query($con, $query);
$invoice_data = mysqli_fetch_assoc($result);
$logo = "1.png"; // Remplacez avec le chemin correct de votre logo

$pdf = new FPDF();
$pdf->AddPage();
$pdf->Image($logo,0 , 0, 50);
// Ajouter les informations de la facture au PDF
$pdf->SetFont('Arial', 'B', 19);
//$pdf->Cell(0, 10, 'Pizza DELICOUS', 0, 1, 'C');
$pdf->SetFont('Arial', '', 12);
$pdf->Cell(0, 10, 'Magasin lot samlalia', 5, 5, 'R');
$pdf->Cell(0, 10, 'MARRAKECH', 5, 5, 'R');
$pdf->Cell(0, 10, 'Tel: 06.84.26.52.52', 5, 5, 'R');


//$pdf->Cell(0, 10, '-----------------------------------', 0, 1, 'C');
$pdf->Ln();
$pdf->Cell(0, 10, 'Sur place :', 0, 1, 'C');
$pdf->Cell(0, 10, 'Ticket N: ' . $invoice_data['id_command'], 0, 1, 'C');
$pdf->Cell(0, 10, 'N_table: ' . $invoice_data['Num_table'], 0, 1, 'C');
$pdf->Cell(0, 10, 'Nom_client: ' . $invoice_data['Nom_Client'], 0, 1, 'C');
$pdf->Cell(0, 10, date("d-m-Y ", strtotime($invoice_data['date'])), 0, 1, 'C');
$pdf->Cell(0, 10, 'Nom_serveur: ' . $invoice_data['Nom_serveur'], 0, 1, 'C');
$pdf->Cell(0, 10, '---------------------------------', 0, 1, 'C');
$pdf->Ln();
$pdf->Cell(20); // Augmentez ou diminuez la valeur pour ajuster le centrage
$pdf->Cell(45, 10, 'Produit', 1);
$pdf->Cell(25, 10, 'QTE', 1);
$pdf->Cell(25, 10, 'PU', 1);
$pdf->Cell(25, 10, 'PT', 1);
$pdf->Ln();

// Récupérer les produits de la commande depuis la base de données
$query_products = "SELECT * FROM produit WHERE id = $invoice_id";
$result_products = mysqli_query($con, $query_products);

// Ajouter les produits au PDF
while ($product = mysqli_fetch_assoc($result_products)) {
    $pdf->Cell(20); // Augmentez ou diminuez la valeur pour ajuster le centrage
    $pdf->Cell(45, 10, $product['Nom_produit'], 1);
    $pdf->Cell(25, 10, $product['prix'], 1);
    $pdf->Cell(25, 10, $product['QTE'], 1);
    $pdf->Cell(25, 10, $product['TOTAL'].'  $', 1);
    $pdf->Ln();
}
$pdf->Cell(20); // Augmentez ou diminuez la valeur pour ajuster le centrage
$pdf->Cell(45, 10, 'TOTAL:', 1, 0,'C' );
//$pdf->Cell(100, 10, '', 1); // Cellule vide pour l'espace
$pdf->Cell(25, 10, $invoice_data['GRAND_TOTAL'].'  $', 1);
$pdf->Ln();

$pdf->Cell(0, 10, '--------------------------------------', 0, 1, 'C');
$pdf->Cell(45, 10, '                                                                                                                             Merci de votre visite ', 0, 1, 'C');

// Enregistrez ou affichez le PDF selon vos besoins
$pdf->Output();
?>
