unit class_taylor;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  { TTaylor }

  TTaylor = class


    private

      function Potencia (y : Real; n:Integer): Real;
      function Factorial (n: Integer): Int64;
      function CoefBinomial(n:Integer; k:Integer): Double;


    public
      Error : Real;
      x : Real;
      function seno(): Real;
      function coseno(): Real;
      function logn(): Real;
      function exp(): Real;
      function arcseno(): Real;
      function arctan(): Real;

      constructor create();
      destructor Destroy; override;
  end;

implementation

function TTaylor.Potencia (y: Real; n: Integer): Real;
var i: Integer;
begin
  Result:= 1;
  for i:=1 to n do
      Result:=Result * y;
end;

function TTaylor.Factorial (n: Integer): Int64;
begin
  case n of
       0,1 : Result:=1;
       else Result:= n * Factorial(n -1);
  end;
end;

function TTaylor.CoefBinomial(n: Integer; k: Integer): Double;
begin
  Result:= Factorial(n)/ Factorial(k) / Factorial(n-k);
end;

constructor TTaylor.create();
begin
  Error:=0.1;
  x:=0;
end;

destructor TTaylor.Destroy;
begin
//
end;

function TTaylor.seno(): Real;
var n: Integer = 0;
    NewError, xnn: Real;
begin
  Result:= (Potencia(-1, n)/ Factorial(2*n + 1)) *
             Potencia(x, 2*n+1);
  repeat
    n:=n+1;
    xnn:= Result;
    Result:= Result + (Potencia(-1, n)/ Factorial(2*n + 1)) *
             Potencia(x, 2*n+1);
    NewError:= abs(Result - xnn);
  until ( (NewError <= Error) or (n > 6));
end;

function TTaylor.coseno(): Real;
var n: Integer = 0;
    NewError, xnn: Real;
begin
  Result:= (Potencia(-1, n)/ Factorial(2*n)) *
             Potencia(x, 2*n);
  repeat
    n:=n+1;
    xnn:= Result;
    Result:= Result + (Potencia(-1, n)/ Factorial(2*n)) *
             Potencia(x, 2*n);
    NewError:= abs(Result - xnn);
  until ( (NewError <= Error) or (n > 6));
end;

function TTaylor.logn(): Real;
var n: Integer = 0;
    NewError, xnn: Real;
begin
  Result:= 2 * ((1/ (2*n+1)) * Potencia(((x -1)/(x+1)),2 *n +1));
  repeat
    n:=n+1;
    xnn:= Result;
    Result:= Result + 2 * ((1/ (2*n+1)) * Potencia(((x -1)/(x+1)),2 *n +1));
    NewError:= abs(Result - xnn);
  until ( (NewError <= Error) or (n > 20));
end;

function TTaylor.exp(): Real;
var n: Integer = 0;
    NewError, xnn: Real;
begin
  Result:= Potencia(x, n) / Factorial(n);
  repeat
    n:=n+1;
    xnn:= Result;
    Result:= Result + Potencia(x, n) / Factorial(n);
    NewError:= abs(Result - xnn);
  until ( (NewError <= Error) or (n > 20));
end;

function TTaylor.arcseno(): Real;
var n: Integer = 0;
    NewError, xnn: Real;
begin
  Result:= Factorial(2*n) / (Potencia (4,n) *
           Potencia(Factorial(n),2)* (2*n+1)) * Potencia(x, 2*n+1);
  repeat
    n:=n+1;
    xnn:= Result;
    Result:= Result + Factorial(2*n) / (Potencia (4,n) *
           Potencia(Factorial(n),2)* (2*n+1)) * Potencia(x, 2*n+1);
    NewError:= abs(Result - xnn);
  until ( (NewError <= Error) or (n > 20));
end;

function TTaylor.arctan(): Real;
var n: Integer = 0;
    NewError, xnn: Real;
begin
  Result:= (Potencia(-1, n)/ (2*n + 1) *
             Potencia(x, 2*n+1));
  repeat
    n:=n+1;
    xnn:= Result;
    Result:= Result + (Potencia(-1, n)/ (2*n + 1) *
             Potencia(x, 2*n+1);
    NewError:= abs(Result - xnn);
  until ( (NewError <= Error) or (n > 6));
end;



end.

