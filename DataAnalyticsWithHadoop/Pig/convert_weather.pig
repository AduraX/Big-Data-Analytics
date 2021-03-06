REGISTER 'hdfs://localhost:54310/MscProj/codes/convert_temp.py' using jython as convert_temp;

-- Load the weather source data
Source = LOAD '/MscProj/scrubbedweather' AS (celsius_readings:chararray);

-- use the UDF to structure and convert the data
ConvertedReadings = FOREACH Source GENERATE FLATTEN(convert_temp.fahrenheit(celsius_readings));

-- Save the results
STORE ConvertedReadings INTO '/MscProj/convertedweather';



