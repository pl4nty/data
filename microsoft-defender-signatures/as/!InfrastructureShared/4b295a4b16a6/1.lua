-- Threat: !InfrastructureShared
-- Name: 4b295a4b16a6
-- Type: 21

local l_0_0 = string.lower(tostring(headerpage))
local l_0_1, l_0_2 = string.gsub(l_0_0, "&#x0a;", "")
local l_0_3, l_0_4 = string.gsub(l_0_0, "&#x0d;", "")
if l_0_2 == 0 then
  return mp.CLEAN
end
if l_0_4 == 0 then
  return mp.CLEAN
end
if 50 < l_0_2 and 50 < l_0_4 then
  return mp.INFECTED
end
return mp.CLEAN
