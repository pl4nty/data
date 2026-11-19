-- Threat: !InfrastructureShared
-- Name: 222983ba42bb
-- Type: 21

local l_0_0 = string.lower(tostring(headerpage))
local l_0_1, l_0_2 = string.gsub(l_0_0, "parseint%(_0x", "")
if 5 < l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
