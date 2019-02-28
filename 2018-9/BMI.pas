program BMICalculator;
uses crt;
var weight, height, BMI: real;
begin
    write('Enter your weight (kg): ');
    readln(weight);
    write('Enter your height (m): ');
    readln(height);
    BMI := weight / (height * height);
    writeln('Your BMI is ', BMI:5:2);
    if BMI < 18.5 then
        writeln('You are underweight.')
    else if BMI <= 25 then
        writeln('You are normal.')
    else
        writeln('You are overweight');
    readkey;
end.