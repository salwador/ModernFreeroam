string.split = function(inputstr, sep)
    if (not sep) then
        sep = "%s";
    end

    local t = {}; 
    local pattern = string.format("([^%s]+)", sep);

    for str in string.gmatch(inputstr, pattern) do
        table.insert(t, str);
    end

    return t;
end