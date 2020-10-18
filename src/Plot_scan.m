function Plot_scan(scan, plot_title, xlow, xhigh, ylow, yhigh)
    % plots the given vectors
    % assumption: first row of scan contains x values, second row of scan contains y values
    % Perform_transformation() will return a result in this shape

    % open a new figure (so creating a new figure does not close any open ones)
    figure();
    % plot the x against y with red circles
    plot(scan(1,:), scan(2,:), 'ro');
    % title the plot with plot_title
    title(plot_title)
    % limit the x and y axis to the values given as input
    xlim([xlow xhigh]);
    ylim([ylow yhigh]);