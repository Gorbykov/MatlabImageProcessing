classdef Image
    %Main class for storing imeges
    %   Detailed explanation goes here
    
   properties
      im %image in double
      title %title string
   end
   methods
      function obj = Image(im,title)
         obj.im = im;
         obj.title = title;
      end
      
      function obj = set.im(obj,value)
          obj.im = im2double(value);
      end
   end
end

