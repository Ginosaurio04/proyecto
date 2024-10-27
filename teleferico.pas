program teleferico;
const 
  MAXIMACAPACIDAD=60;
  PRECIOGENERAL=20;
  PRECIOTERCERAEDADYMENORES=12;
var
  precioboleto,boletosven,boletosgeneralesven,boletosterceraedadven,boletosmenoresven,monto,montototal,opcion,tipoboleto,cantidadboletos,tipoviaje,estacionllegada:integer;
  nombre,apellido,cedula:string;
begin
  boletosven:=0;
  montototal:=0;
  boletosgeneralesven:=0;
  boletosterceraedadven:=0;
  boletosmenoresven:=0;
  repeat
    Writeln('------------Bienvenido al teleferico de Merida------------');
    Writeln('Que desea hacer hoy?');
    Writeln('1.Comprar boleto');
    Writeln('2.Ver sistema');
    Writeln('3.salir');
    Readln(opcion);
    case opcion of
      1:begin
      Writeln('------------Compra de Boletos------------');
      Writeln('Ingrese su nombre:');
      Readln(nombre);
      Writeln('Ingrese su apellido:');
      Readln(apellido);
      Writeln('Ingrese su cedula:');
      Readln(cedula);
      Writeln('Ingrese su estacion de llegada:');
      Writeln('1. La Barinitas');
      Writeln('2. La Montana');
      Writeln('3. La Aguada');
      Writeln('4. Loma Redonda');
      Writeln('5. Pico Espejo');
      Readln(estacionllegada);
      Writeln('Ingrese tipo de boleto');
      Writeln('1. General');
      Writeln('2. Tercera Edad y ninos de 3-12');
      Writeln('3. Ninos menores de 3');
      Readln(tipoboleto);
      Writeln('Ingrese la cantidad de boletos que desea comprar:');
      Readln(cantidadboletos);
      WriteLn('Ingrese tipo de viaje');
      WriteLn('1. Ida');
      WriteLn('2. Ida y Vuelta');
      ReadLn(tipoviaje);
      if (cantidadboletos+boletosven>MAXIMACAPACIDAD) then
      begin
        WriteLn('No hay asientos disponibles, vuelva luego.');
        readln;
      end
      else 
      begin
        case tipoboleto of
          1:begin
            precioboleto:= PRECIOGENERAL;
            boletosgeneralesven:=boletosgeneralesven+cantidadboletos;
          end;
          2:begin
            precioboleto:=PRECIOTERCERAEDADYMENORES;
            boletosgeneralesven:=boletosgeneralesven+cantidadboletos;
          end;
          3:begin
            precioboleto:=0;
            if estacionllegada>4 then
              begin
                WriteLn('Los ninos menores de 3 solo pueden llegar hasta Loma Redonda.');
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
          montototal:=montototal+monto;
          boletosven:=boletosven+cantidadboletos;
          WriteLn('Boletos comprados exitosamente, gracias por comprar en Teleferico de Merida.');
          WriteLn('Presione Enter para volver al menu');
        end;
        ReadLn  
      end;  
    end;
    3: begin
      WriteLn('Muchas gracias por acceder Teleferico Merida vuelva pronto.')
    end;
    else 
    begin
      WriteLn('No se encuentra esa opcion, por favor intetelo de nuevo.');
      WriteLn('Presione Enter para volver al menu');
      ReadLn
    end;
    end;
  until (opcion=3);
end.  