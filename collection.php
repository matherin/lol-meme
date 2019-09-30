<?php

// XML-Quellen laden
$xml = new DOMDocument;
$xml->load('ressources/collection.xml');

$xsl = new DOMDocument;
$xsl->load('ressources/collection.xsl');

// Prozessor instanziieren und konfigurieren
$proc = new XSLTProcessor;
$proc->importStyleSheet($xsl); // XSL Document importieren

echo $proc->transformToXML($xml);

?>
