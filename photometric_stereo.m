function [albedo_image, surface_normals] = photometric_stereo(Sclsubbedimarr, light_dirs)
% imarray: h x w x Nimages array of Nimages no. of images
% light_dirs: Nimages x 3 array of light source directions
% albedo_image: h x w image
% surface_normals: h x w x 3 array of unit surface normals


%% <<< fill in your code below >>>
L = light_dirs;
Lt = transpose(L);
LtL = Lt*L;
InvLtL = inv(LtL);

[h, w, d] = size(Sclsubbedimarr);
for x=1:h
    for y=1:w
        Exy = Sclsubbedimarr(x,y,:);
        Exy = reshape(Exy,64,1);     %64*1 intensity matrix for x,y point of image
        N = LtL\(Lt*Exy);
        X = (N(:).^2);
        Y = sum(X(:));
        uN(x,y)= sqrt(Y);
        n(x,y,:) = N/uN(x,y);            % 192*168*3 matrix for surface normal vectors corresponding to each point x,y
    end
end
albedo_image = uN;
surface_normals = n;
