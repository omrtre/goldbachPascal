program Goldbach;

{$mode objfpc}{$H+}

// import sys
uses
    SysUtils;

// Create some functions to handle "gettingPrimes", "goldBach", "read n write", "printing", and "mainLoop"
type
    TIntArray = array of Integer;


// GetPrime
// Is this a Prime number? Boolean is True // False
function getPrimes(maxNumber: Integer): TIntArray;
var
    primes:  array of Integer;
    value, prime, n: Integer;
    isPrime: Boolean;
begin
    SetLength(primes, 0);
    for value := 2 to maxNumber do // from the range 2 to maxNumber
    begin
        isPrime := True;
        for n := 0 to Length(primes) - 1 do // loop through this array, and loop within prime
        begin
            prime := primes[n];
            if value mod prime = 0 then // This is going to determine whether it is a prime or not.
            begin
                isPrime := False; // If not, then break
                Break;
            end;
        end;

        if isPrime then
        begin
        // primes.append(value) // This is going to add the primes into the array
            SetLength(primes, Length(primes) + 1);
            primes[Length(primes) - 1] := value;
        end;
    end;
    Result := primes;
end;

// Goldbach
// Find the pairs, set them up
//function calculateGoldBach(n: Integer; var pairCount: Integer);
//var
//    a, b, c: Integer;
//begin
//
//end;
function Goldbach(value: Integer): TIntArray;
var
    primes, goldbachResult: array of Integer;
    prime, difference, i: Integer;
    found: Boolean;
begin
    SetLength(goldbachResult, 0);
    if (value >= 4) and (value mod 2 = 0) then
    begin
        primes := GetPrimes(value);
        for prime in primes do
        begin
            if prime > value div 2 then
                Break;
            difference := value - prime;

            // Find the difference in the array
            found := False;
            for i := 0 to Length(primes) -1 do
            begin
                if primes[i] = difference then
                begin
                    found := True;
                    Break;
                end;
            end;

            if found then
            begin
                SetLength(goldbachResult, Length(goldbachResult) + 1);
                goldbachResult[Length(goldbachResult) - 1] := prime;
            end;
        end;
    end;
    Goldbach := goldbachResult;
end;


// PrintGoldbach
// Print the pairs in the desired formation
//function printGoldBach();

//
//var
//    primeNumbers: array of Integer;
//    prime: Integer;
//begin
//  primeNumbers := GetPrimes(20); // Call GetPrimes to get prime numbers up to 20

  // Print the prime numbers
//    Write('Prime numbers up to 20: ');
//    for prime in primeNumbers do
//        Write(prime, ' ');
//    WriteLn;
//end.

procedure printGoldbach(value: Integer; primeList: array of Integer);
var
    prime, difference: Integer;
begin
    if Length(primeList) = 0 then
        Writeln('We found no Goldbach pairs for ', value, '.')
    else
    begin
        Writeln('We found ', Length(primeList), ' Goldbach pair(s) for ', value, '.');
        for prime in primeList do
            begin
                difference := value - prime;
                Writeln(value, ' = ', prime, ' + ', difference);
            end;
    end;
    Writeln('');
end;

// ReadFile
// Read the files that are given
//function readFile();
function readFile(const fileName: string): TIntArray;
var
    fileHandle: TextFile;
    line: string;
    begin
        SetLength(Result, 0);
        AssignFile(fileHandle, fileName);
        Reset(fileHandle);
    while not EOF(fileHandle) do
    begin
        Readln(fileHandle, line);
        SetLength(Result, Length(Result) + 1);
        Result[Length(Result) - 1] := StrToInt(line);
    end;
    CloseFile(fileHandle);
end;

// Main
// Run the main sofware here
//procedure main();
procedure Main();
var
    data, primeList, fileData: array of Integer;
    i: Integer;
begin
    if ParamCount > 0 then
    begin
        for i := 1 to ParamCount do
        begin
            fileData := ReadFile(ParamStr(i));
            SetLength(data, Length(data) + Length(fileData));
            Move(fileData[0], data[Length(data) - Length(fileData)], Length(fileData) * SizeOf(Integer));
        end;
    end
    else
        data := [3, 4, 14, 26, 100];

    for i := 0 to Length(data) - 1 do
    begin
        primeList := Goldbach(data[i]);
        PrintGoldbach(data[i], primeList);
    end;
end;

begin
    Main()
end.

// Compute for one or more input values

// For each input value, utput a statement reporting how many Goldbach pairs have been found, before outputting the found Goldbach pairs
// store all found Goldbach pairs so you can count them before outputting

// output one line for each pair of the found Goldbach pairs
// form of <input value> = <p> + <q>, with p <= q. The lines should be arranged in increasing order of <p>

// when giving no command line argument, program should output the Goldbach pairs for the input values of 3, 4, 14, 26, and 100

// given one or more command line arguments, your program should assume that the first argument to be the name of an input file, and process all numbers stored in that file

// assume that the input file always exists, and it contains data in the correct format

// assume that the input file contains one number per line, and those numbers ae always even integers between 4 to 100,000 (inclusive)
// umber of lines in the file is NOT known in advance, and the end of the file signals the end of input.