function output=analyze(kind,truth,preds)	
% function output=analyze(kind,truth,preds)		
%
% Analyses the accuracy of a prediction
% Input:
% kind='acc' classification error
% kind='abs' absolute loss
% (other values of 'kind' will follow later)
% 

switch kind
	case 'abs'
		output = sum(abs(truth-preds))/size(preds,2);
		
	case 'acc' 
		output = (size(preds,2)-nnz(truth-preds))/size(preds,2);
		 	
end;

