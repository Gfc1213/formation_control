pstart = [0 0];
pgoal  = [5 5];

line_segment = [];
vertice_matrix = [1 pstart(1) pstart(2) 0];
vertice_matrix = [vertice_matrix ; [2 pgoal(1) pgoal(2) 0]];
vertice_count = 3;
line_count = 1;

[conv_shape_x conv_shape_y] = calc_convex_shape(obstacle_1_x, obstacle_1_y);
[total_shape_x, total_shape_y] = calc_minkowski_sum( conv_shape_x, conv_shape_y, 5);
[minkowski_shape_x minkowski_shape_y] = calc_convex_shape(total_shape_x, total_shape_y);
plot(minkowski_shape_x,minkowski_shape_y,'o')
hold on 
plot(obstacle_1_x, obstacle_1_y,'x')
initial_vertex = vertice_count;
for i = 1 : 1 :  length(minkowski_shape_x)
    end_point1 = vertice_count;
    end_point2 = vertice_count + 1 ;
    if(end_point2 > length(minkowski_shape_x) + initial_vertex - 1)
        end_point2 = initial_vertex;
    end
  line_segment = [line_segment; [line_count end_point1 end_point2 1]];
  vertice_matrix = [vertice_matrix; [vertice_count minkowski_shape_x(i) minkowski_shape_y(i) 1]];
  vertice_count =  vertice_count + 1;
  line_count =  line_count + 1;
end



[conv_shape_x conv_shape_y] = calc_convex_shape(obstacle_2_x, obstacle_2_y);
[total_shape_x, total_shape_y] = calc_minkowski_sum( conv_shape_x, conv_shape_y, 5);
[minkowski_shape_x minkowski_shape_y] = calc_convex_shape(total_shape_x, total_shape_y);
initial_vertex = vertice_count;
for i = 1 : 1 :  length(minkowski_shape_x)
    end_point1 = vertice_count;
    end_point2 = vertice_count + 1 ;
    if(end_point2 > length(minkowski_shape_x) + initial_vertex - 1)
        end_point2 = initial_vertex;
    end
  line_segment = [line_segment; [line_count end_point1 end_point2 2]];
  vertice_matrix = [vertice_matrix; [vertice_count minkowski_shape_x(i) minkowski_shape_y(i) 2]];
  vertice_count =  vertice_count + 1;
  line_count =  line_count + 1;
end



[conv_shape_x conv_shape_y] = calc_convex_shape(obstacle_3_x, obstacle_3_y);
[total_shape_x, total_shape_y] = calc_minkowski_sum( conv_shape_x, conv_shape_y, 5);
[minkowski_shape_x minkowski_shape_y] = calc_convex_shape(total_shape_x, total_shape_y);
initial_vertex = vertice_count;
for i = 1 : 1 :  length(minkowski_shape_x)
    end_point1 = vertice_count;
    end_point2 = vertice_count + 1 ;
    if(end_point2 > length(minkowski_shape_x) + initial_vertex - 1)
        end_point2 = initial_vertex;
    end
  line_segment = [line_segment; [line_count end_point1 end_point2 3]];
  vertice_matrix = [vertice_matrix; [vertice_count minkowski_shape_x(i) minkowski_shape_y(i) 3]];
  vertice_count =  vertice_count + 1;
  line_count =  line_count + 1;
end

line_segment
vertice_matrix

 
 dummy = size(vertice_matrix);
 number_of_vertices = dummy(1);
 visibility_matrix = zeros(number_of_vertices,number_of_vertices);
for i = 1 : 1 : number_of_vertices
  array = visible_vertices(i,line_segment, vertice_matrix);
  visibility_matrix(i,array)  = 1;
end


for i = 1 : 1 : number_of_vertices
 indexes = find(visibility_matrix(i,:) == 1);
 for j = 1 : 1 : length(indexes)
     plot([vertice_matrix(i,2) vertice_matrix(i,3)], [vertice_matrix(indexes(j),2) vertice_matrix(indexes(j),3)])
     hold on
 end
 
end
    
