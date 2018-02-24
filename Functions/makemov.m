function makemov( A, framerate, T )
%MAKEMOV Summary of this function goes here
%   Detailed explanation goes here

N = T*framerate;

for i = 1:N
    skip = 5;
    figure(1)
    set(gcf,'units','centimeters','position',[25 35 20 15]);
    surf(A(:, :, i), 'Edgecolor', 'none');
    view(2);
%     zlim([-0.3, 0.32]);
%     drawnow;
    colormap jet;
    
    figure(2)
    set(gcf,'units','centimeters','position',[25 0 20 15]);
    surf(A(:, :, i+skip), 'Edgecolor', 'none');
    view(2);
%     zlim([-0.3, 0.32]);
    drawnow;
    colormap jet;
    pause(1/framerate);
    
end
    
end

