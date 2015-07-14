function bing_clusterham_cluster_latex(bing_cluster)
% This script runs two simple examples of latexTable.m
clc; clear input;

%% Example 1: using an numerical array as data input
fprintf('Example 1: using an array as data input\n\n');

for i = 1:length(bing_cluster)
	% numeric values you want to tabulate:
	% this field has to be an array or a MATLAB table
	% in this example we use an array
	input.data = bing_cluster(i).V
	% bing_cluster_hex_pyr_face_1.V;
	% Optional fields:

	% Set column labels (use empty string for no label):
	input.tableColLabels = {'$V_1$','$V_2$','$V_3$'};
	% Set row labels (use empty string for no label):
	input.tableRowLabels = {'$q_0$','$q_1$','$q_2$','$q_3$'};

	% Switch transposing/pivoting your table:
	input.transposeTable = 1;

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
	% input.dataFormat = {'%.3f',2,'%.3f',1}; % three digits precision for first two columns, one digit for the last

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
end



