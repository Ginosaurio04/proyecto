program teleferico;
uses crt,sysutils;
const 
  MAXIMACAPACIDAD=60;
  PRECIOGENERAL=20;
  PRECIOTERCERAEDADYMENORES=12;
var
  precioboleto,boletosven,boletosgeneralesven,boletosterceraedadven,boletosmenoresven,tipoboleto,monto,montototal,opcion,cantidadboletos,tipoviaje,estacionllegada,i,asientosdisponibles,boletoscancelados:LongInt;
  nombre,apellido,cedula,estacionllegadaen,tipoboletoen,cantidadboletosen,tipoviajeen:string;
  valido:Boolean;
  confirmar:char;
begin
  boletosven:=0;
  montototal:=0;
  boletosgeneralesven:=0;
  boletosterceraedadven:=0;
  boletosmenoresven:=0;
  boletoscancelados:=0;
  repeat
  clrscr;
  asientosdisponibles:=(MAXIMACAPACIDAD - boletosven);
    Writeln('------------Bienvenido al teleferico de Merida------------');
    Writeln('Que desea hacer hoy?');
    Writeln('1.Comprar boleto');
    Writeln('2.Ver sistema');
    Writeln('3.salir');
    Readln(opcion);
    case opcion of
      1:begin
      clrscr;
      if asientosdisponibles=0 then
      begin
        WriteLn('No se encuentran asientos disponibles.');
        WriteLn('Presione enter para volver al menu');
        ReadLn
      end
      else  
      repeat
        clrscr;
        Writeln('------------Bienvenido al teleferico de Merida------------');
        Writeln('Ingrese su nombre:');
        Readln(nombre);
        valido:=true;
        for i:=1 to Length(nombre) do
          if not (nombre[i] in ['A'..'Z','a'..'z']) then
          begin
              WriteLn('El nombre nada mas puede contener letras. Presione enter para intentar de nuevo.');
              valido:=false;
              ReadLn;
              break;
          end;
      until valido;
      repeat
        clrscr;
        Writeln('------------Compra de Boletos------------');
        Writeln('Ingrese su apellido:');
        Readln(apellido);
        valido:=True;
        for i:=1 to Length(apellido) do
          if not(apellido[i] in ['A'..'Z','a'..'z']) then
          begin
            WriteLn('El apellido nada mas puede contener letras. Presione enter para intentar de nuevo.');
            valido:= false;
            Readln;
            break;
          end;
      until valido;
      repeat
        clrscr;
        Writeln('------------Compra de Boletos------------');  
        Writeln('Ingrese su cedula:');
        Readln(cedula);
        valido:=true;
        for i:=1 to Length(cedula) do
          if not(cedula[i] in ['1'..'9']) then
          begin
            WriteLn('La cedula nada mas puede contener numeros. Presione enter para intentar de nuevo.');
            valido:=false;
            ReadLn;
            Break;
          end;
      until valido;
      repeat
        clrscr;
        Writeln('------------Compra de Boletos------------');
        Writeln('Ingrese su estacion de llegada:');
        Writeln('1. La Barinitas');
        Writeln('2. La Montana');
        Writeln('3. La Aguada');
        Writeln('4. Loma Redonda');
        Writeln('5. Pico Espejo');
        Readln(estacionllegadaen);
          if TryStrtoInt(estacionllegadaen,estacionllegada) then
          begin
            if (estacionllegada>=1) and (estacionllegada<=5) then
              Break
            else    
            WriteLn('Estacion de llegada no valida. Presione enter para intentar de nuevo.');            
          end
          else
            WriteLn('La estacion de llegada se elije a traves de numero. Presione enter para intentar de nuevo.');
            ReadLn;
      until false;
      repeat
        clrscr;
        Writeln('------------Compra de Boletos------------');
        Writeln('Ingrese tipo de boleto');
        Writeln('1. General');
        Writeln('2. Tercera Edad y ninos de 3-12');
        Writeln('3. Ninos menores de 3');
        Readln(tipoboletoen);
        if TryStrtoInt(tipoboletoen,tipoboleto) then
        begin
          if (tipoboleto>=1) and (tipoboleto<=3) then
            Break
          else  
          WriteLn('Tipo de boleto no encontrado, Presione enter para intentar de nuevo.');
        end
        else 
        Writeln('Los tipos de boletos se elije a traves de numeros. Presione enter para intentar de nuevo.'); 
        Readln; 
      until false;
      repeat
        clrscr;
        Writeln('------------Compra de Boletos------------');
        WriteLn('Cantidad de asientos disponibles: ',(MAXIMACAPACIDAD - boletosven));
        Writeln('Ingrese la cantidad de boletos que desea comprar:');
        Readln(cantidadboletosen);
        if TryStrtoInt(cantidadboletosen,cantidadboletos) then
        begin
          if (cantidadboletos<asientosdisponibles) and (cantidadboletos>0) then
          begin
            Break
          end  
        else if (cantidadboletos<0) then
        begin
          WriteLn('La compra de boletos debe ser mayor a 0. Presione enter para intentar de nuevo.');
          Readln;
        end
        else
        begin
          WriteLn('No hay sufientes asientos disponibles, Presione enter para intentar de nuevo.');
          Readln;
        end;
        end
        else
        begin
          WriteLn('La cantidad de boleto debe ser un numero. Presione enter para intentar de nuevo.');
          Readln;
        end;  
      until (cantidadboletos>0) and (cantidadboletos<=asientosdisponibles);
      repeat
        clrscr;
        Writeln('------------Compra de Boletos------------');
        WriteLn('Seleccione tipo de viaje');
        WriteLn('1. Ida');
        WriteLn('2. Ida y Vuelta');
        ReadLn(tipoviajeen);
        if TryStrtoInt (tipoviajeen,tipoviaje) then
        begin
          if (tipoviaje=1) or (tipoviaje=2) then
            break
          else 
            WriteLn('Tipo de viaje no encontrado, Presione enter para intentar de nuevo.');
        end
        else 
          WriteLn('Los tipos de viaje se elijen a traves de numeros. Presione enter para intentar de nuevo.');
          Readln;
      until false;  
        case tipoboleto of
          1:begin
            precioboleto:= PRECIOGENERAL;
            boletosgeneralesven:=boletosgeneralesven+cantidadboletos;
          end;
          2:begin
            precioboleto:=PRECIOTERCERAEDADYMENORES;
            boletosterceraedadven:=boletosterceraedadven+cantidadboletos;
          end;
          3:begin
            precioboleto:=0;
            if estacionllegada>4 then
              begin
                WriteLn('Los ninos menores de 3 solo pueden llegar hasta Loma Redonda. Presiones Enter para volver al menu.');
                ReadLn;
              end
              else
              begin
              boletosmenoresven := boletosmenoresven+cantidadboletos;
              end;
          end;  
        end;
        if (tipoboleto<>3)or(estacionllegada<=4) then
        begin
          monto:=precioboleto*cantidadboletos;
          if tipoviaje=2 then
            monto:=monto*2;
          montototal:=montototal+monto;
          boletosven:=boletosven+cantidadboletos;
          repeat
            clrscr;
            Writeln('------------Compra de Boletos------------');
            WriteLn('Esta seguro de su compra de ',cantidadboletos,' boletos (s/n)');
            ReadLn(confirmar);
            if (confirmar='n') or (confirmar='N') then
            begin
              WriteLn('La compra de boletos a sido cancelada.');
              WriteLn('Presione enter para volver al menu');
              boletoscancelados:=boletoscancelados+cantidadboletos;
              boletosven:=boletosven-cantidadboletos;
              ReadLn;
              break;
            end
            else if (confirmar='s') or(confirmar='S') then
            begin
              clrscr;
              Writeln('------------Compra de Boletos------------');
              WriteLn('Los boletos han sido comprado exitosamente.');
              WriteLn('Presione enter para volver al menu');
              ReadLn;
              Break;
            end
            else 
              WriteLn('Opcion no valida. Presione enter para intentar de nuevo.'); 
              ReadLn
          until False;
        end;  
      end;  
    2: begin
        clrscr;
        writeln('------------------ver sistema--------------------');
        writeln('Boletos vendidos:');
        writeln('   - Generales: ', boletosgeneralesven);
        writeln('   - Tercera edad/ninos: ', boletosterceraedadven);
        writeln('   - Menores de 3: ', boletosmenoresven);
        WriteLn('   - Cancelados: ',boletoscancelados);
        writeln('   - Total: ', boletosven);
        writeln('Asientos disponibles: ', asientosdisponibles);
        writeln('Reporte de ventas del dia:', montototal);
        WriteLn('Presiones Enter para volver al menu');
        ReadLn;
   end;
    3: begin
        clrscr;
        WriteLn('Muchas gracias por acceder Teleferico Merida vuelva pronto.');
        WriteLn('Presione enter para salir');
        ReadLn;
    end;
    else 
    begin
      WriteLn('No se encuentra esa opcion. Presione enter para volver al menu');
      ReadLn;
    end;
    end;
  until (opcion=3);
end. 