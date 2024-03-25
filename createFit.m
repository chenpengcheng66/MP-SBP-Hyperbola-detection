function [fitresult, gof] = createFit(data_x, data_y)
%CREATEFIT(DATA_X,DATA_Y)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : data_x
%      Y Output: data_y
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 25-Mar-2024 15:16:02 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( data_x, data_y );

% Set up fittype and options.
ft = fittype( 'sqrt(a^2*(1+((x-78).^2)/b));', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [0 0];
opts.StartPoint = [100 100];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, xData, yData );
legend( h, 'data_y vs. data_x', 'untitled fit 1', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'data_x', 'Interpreter', 'none' );
ylabel( 'data_y', 'Interpreter', 'none' );
grid on


