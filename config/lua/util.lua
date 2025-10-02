
function String_split(str --[[string]], separator --[[string]]) --[[string]]
    local strarr = {};

    for part in string.gmatch(str, "([^".. separator .."]+)") do
        table.insert(strarr, part);
    end

    return strarr;
end;
