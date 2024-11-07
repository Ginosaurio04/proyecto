program fibonacci;
var
i,limite: integer;
fibonacci: array[1..100] of integer;
begin
    limite:= 100;
    fibonacci[1]:=0;
    fibonacci[2]:=1;
    for i:= 3 to limete do
    fibonacci[i]:= fibonacci[i-1]+fibonacci[i-2];
    for i:= 1 to limite do
    WriteLn(fibonacci[i]);
end