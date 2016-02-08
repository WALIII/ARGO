function [Dstr_max_structure] = csvread_all()
    d = dir('*.csv');
    for i = length(d);
    g{i} = csvread(d(i));
    end
end