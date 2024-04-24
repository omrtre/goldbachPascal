program Goldbach;

// import sys
uses 
    SysUtils; 

// Create some functions to handle "gettingPrimes", "goldBach", "read n write", "printing", and "mainLoop"

// GetPrime
// Is this a Prime number? Boolean is True // False
function getPrimes(maxNumber: Integer): TArray<Integer>;
var 
    primes: TArray<Integer>;
    value, prime, n: Integer;
    isPrime: Boolean;
begin
    SetLength(primes, 0)
    for value := 2 to maxNumber do // from the range 2 to maxNumber 
    begin
        isPrime := True;
        for i := 0 to Length(primes) - 1 do // loop through this array, and loop within prime
        begin
            prime := primes[i] 
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
function calculateGoldBach(n: Integer; var pairCount: Integer);
var
    a, b, c: Integer;
begin

end;

// PrintGoldbach
// Print the pairs in the desired formation
function printGoldBach();

// ReadFile
// Read the files that are given
function readFile();


// Main
// Run the main sofware here
procedure main();


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
begin
    writeln('HelloWorld');
end.
