pkg load io;

% Is here so Octave does not think this is a script
1;

% helper function so I don't have to type the axis limits every time
function Plot_helper(scan, plot_title)
    Plot_scan(scan, plot_title, -10, 110, -10, 110);
end

% Note: RangeData_04_A1.xlsx needs to be in same folder as this script!
% read sheet Scan 1
[~,~,rawData] = xlsread(fullfile('./','RangeData_04_A1.xlsx'), 'Scan 1');
% transform scanned values to W
trans1 = Transform_2D(45, 10, 30, rawData(:,2), rawData(:,1));
% plot transformed values
Plot_helper(trans1, 'Scan 1 in W');

% read sheet Scan 2
[~,~,rawData] = xlsread(fullfile('./','RangeData_04_A1.xlsx'), 'Scan 2');
% transform scanned values to W
trans2 = Transform_2D(120, 50, 50, rawData(:,2), rawData(:,1));
% plot transformed values
Plot_helper(trans2, 'Scan 2 in W');

% add transformed values of Scan 1 and 2 together
curTrans = [trans1 trans2];
% plot current occupancy grid
Plot_helper(curTrans, 'Occupancy Grid after 2 Scans');

% read sheet Scan 3
[~,~,rawData] = xlsread(fullfile('./','RangeData_04_A1.xlsx'), 'Scan 3');
% transform scanned values to W
trans3 = Transform_2D(-17, 90, 40, rawData(:,2), rawData(:,1));
% plot transformed values
Plot_helper(trans3, 'Scan 3 in W');

% add transformed values of Scan 3 to the other transformed values
totalTrans = [curTrans trans3];
% plot final occupancy grid
Plot_helper(totalTrans, 'Occupancy Grid after 3 Scans');