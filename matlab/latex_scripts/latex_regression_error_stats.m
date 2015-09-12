function latex_regression_error_stats(circ_error_stats_struct)

clc; clear input;

%   Convert the generated struct to a no_of_faces * 11 array (11 is the
%   no_of_stats)
input.data = permute(cell2mat(struct2cell(circ_error_stats_struct)), [3 1 2]);

% Set column labels (use empty string for no label):
input.tableColLabels = {'Mean', 'Median', 'Var', 'Std\_dev', 'Max', 'Min', 'Skewness', 'Kurtosis', 'Res vec length', 'Corr', 'Corr\_p\_value'};
% Set row labels (use empty string for no label):
% Cube v/s wedge
if (size(input.data, 1)==5)
    input.tableRowLabels = {'Face\_1','Face\_2','Face\_3','Face\_4','Face\_5'};
elseif (size(input.data, 1)==6)
    input.tableRowLabels = {'Face\_1','Face\_2','Face\_3','Face\_4','Face\_5','Face\_6'};
end

% Switch transposing/pivoting your table:
input.transposeTable = 0;

% Determine whether input.dataFormat is applied column or row based:
input.dataFormatMode = 'column'; % use 'column' or 'row'. if not set 'colum' is used

% Formatting-string to set the precision of the table values:
% For using different formats in different rows use a cell array like
% {myFormatString1,numberOfValues1,myFormatString2,numberOfValues2, ... }
% where myFormatString_ are formatting-strings and numberOfValues_ are the
% number of table columns or rows that the preceding formatting-string applies.
% Please make sure the sum of numberOfValues_ matches the number of columns or
% rows in input.tableData!
%
input.dataFormat = {'%.4f'} % three digits precision for first two columns, one digit for the last

% Define how NaN values in input.tableData should be printed in the LaTex table:
input.dataNanString = '-';

% Column alignment in Latex table ('l'=left-justified, 'c'=centered,'r'=right-justified):
input.tableColumnAlignment = 'c';

% Switch table borders on/off:
input.tableBorders = 1;

% LaTex table caption:
input.tableCaption = inputname(1);
%caption is same as the variable name of the argument

% LaTex table label:
input.tableLabel = 'MyTableLabel';

% Switch to generate a complete LaTex document or just a table:
input.makeCompleteLatexDocument = 0;

% call latexTable:
latex = latexTable(input);




