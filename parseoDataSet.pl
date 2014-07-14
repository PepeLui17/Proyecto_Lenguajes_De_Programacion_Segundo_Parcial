# Leer un fichero de texto
my $filename = 'dataBaseVuelos.txt';
open INFILE,$filename;
my $linea;

my $origen1=0;
my $origen2=1;

my $destino1=2;
my $destino2=3;

my $distancia=17;

while ( $linea = <INFILE>) {
    chomp($linea); 
    my @data = split(",", $linea);
    #$line = @data[$origen1].@data[$origen2]."|".@data[$destino1].@data[$destino1]."|".@data[$distancia];
    $line = @data[$origen1]."|".@data[$destino1]."|".@data[$distancia];
    $line =~ tr /"//d ; 
    # Abre el archivo (o lo crea si no existe)
	open (FILE, ">> vuelos_distancia.txt");
	#Scrive
	print FILE $line."\n";
} 
# Cierra el archivo
close INFILE;
close FILE;