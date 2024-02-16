#!/bin/bash

# Ajout du chemin vers le fichier JAR de Saxon au CLASSPATH
export CLASSPATH="${CLASSPATH}:/opt/saxon/saxon-he-11.5.jar"

# Exécution de la transformation XSLT avec Saxon
java net.sf.saxon.Transform -s:teacher-3.xml -xsl:traverse-plus.xsl
