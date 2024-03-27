function [fitresult, gof] = curve_fitting(data_x, data_y, x0)

    [xData, yData] = prepareCurveData( data_x, data_y );
    
    %%sqrt(a^2*(1+((x-x0).^2)/b))
    x0 = num2str(x0, '%.2f');
    equa_hyba=['sqrt(a^2*(1+((x-', x0];
    equa_hyba=[equa_hyba,').^2)/b));'];

    ft = fittype( equa_hyba, 'independent', 'x', 'dependent', 'y' );
    opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
    opts.Display = 'Off';
    opts.Lower = [0 0];
    opts.StartPoint = [100 100];
    
    [fitresult, gof] = fit( xData, yData, ft, opts );
    
    figure( 'Name', 'Hyperbola' );
    h = plot( fitresult, xData, yData );
    legend( h, 'data_y vs. data_x', 'Hyperbola', 'Location', 'NorthEast', 'Interpreter', 'none' );
    
    xlabel( 'data_x', 'Interpreter', 'none' );
    ylabel( 'data_y', 'Interpreter', 'none' );
    grid on

end
