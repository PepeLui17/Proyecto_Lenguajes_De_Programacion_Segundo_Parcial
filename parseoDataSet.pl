# Leer un fichero de texto
my $filename = 'dataBaseVuelos.txt';
open INFILE,$filename;
my $linea;

my $origen1=0;
my $origen2=1;

my $destino1=2;
my $destino2=3;

my $distancia=17;
my $costo=19;
my $op=0;
while ( $linea = <INFILE>) {
    chomp($linea); 
    my @data = split(",", $linea);
    #$line = @data[$origen1].@data[$origen2]."|".@data[$destino1].@data[$destino1]."|".@data[$distancia];
    #$line = @data[$origen1]."|".@data[$destino1]."|".@data[$costo];
    #$line =~ tr /"//d ; 
    if($op==1){
    	$line = @data[$origen1]."|".@data[$destino1]."|".@data[$distancia];
    	$line =~ tr /"//d ; 
       	# Abre el archivo (o lo crea si no existe)
		open (FILE, ">> vuelos_distancia.txt");
		print FILE $line."\n";		
	}
	if(op==0){
		$line = @data[$origen1]."|".@data[$destino1]."|".@data[$costo];
		$line =~ tr /"//d ;
		if($line=~/([0-9]+).([0-9]+)/){
			$lineas = @data[$origen1]."|".@data[$destino1]."|".$1;
			$lineas =~ tr /"//d ;
			# Abre el archivo (o lo crea si no existe)
			open (FILE, ">> vuelos_costo.txt");
			print FILE $lineas."\n";
		
		}				
	}
	#print FILE $line."\n";
} 
# Cierra el archivo
close INFILE;
close FILE;