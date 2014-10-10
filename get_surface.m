function  height_map = get_surface(surface_normals, image_size)
% surface_normals: h x w x 3 array of unit surface normals
% image_size: [h, w] of output height map/image
% height_map: height map of object of dimensions [h, w]



    
%% <<< fill in your code below >>> 
z = surface_normals;
h = image_size(:,1);
w = image_size(:,2);
for x=1:h
    for y=1:w
        a = z(x,y,1);
        b = z(x,y,2);
        c = z(x,y,3);
        p(x,y) = a/c;
        q(x,y) = b/c; 
    end
end
 htm = zeros(h,w);
 
 for x=1:h-1
     for y=1:w-1
         htm(x,y+1) = htm(x,y)+p(x,y+1);
         htm(x+1,y) = htm(x,y)+q(x+1,y);
     end
 end

 height_map = htm;