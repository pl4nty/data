-- Threat: !InfrastructureShared
-- Name: 90296d0822ca
-- Type: 21

local l_0_0 = string.lower(tostring(headerpage))
local l_0_1 = string.match(l_0_0, "<param name=\"movie\" value=\"/(.-)\">")
if l_0_1 then
  local l_0_2 = string.match(l_0_0, "<embed name=\"%l-\" width=\"115\" height=\"110\" align=\"middle\" pluginspage=\".-\" src=\"/(.-)\" type=\"")
  if l_0_2 and l_0_2 == l_0_1 and string.find(l_0_1, "^%l-%.%l-%?%w%w%w%w-=") then
    local l_0_3 = 0
    for l_0_4 in string.gmatch(l_0_1, "=%w%w%w%w-&") do
      l_0_3 = l_0_3 + 1
    end
    if 2 <= l_0_3 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
