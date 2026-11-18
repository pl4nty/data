-- Threat: !InfrastructureShared
-- Name: !#TELPER:Backdoor:Win32/Dipsind!Conf!dha
-- Type: 13

local l_0_0 = mp.getfilesize()
if l_0_0 < 2000 or 2500 < l_0_0 then
  return mp.CLEAN
end
if mp.bitand(mp.readu_u32(headerpage, 1), 91) ~= 91 and mp.bitand(mp.readu_u32(headerpage, 1), 23296) ~= 23296 then
  return mp.CLEAN
end
local l_0_1 = tostring(headerpage)
local l_0_2 = string.lower(l_0_1)
local l_0_3 = string.match(string.sub(l_0_2, 0, 30), "(%[[/%a%d]+?%])")
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = string.match(string.sub(l_0_2, 10, 370), "([/%a%d]+%?%?=[/%a%d]+%?)")
if l_0_4 == nil then
  return mp.CLEAN
end
return mp.INFECTED
