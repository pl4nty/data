-- Threat: !InfrastructureShared
-- Name: !#Lua:Xtrat_Config!dat
-- Type: 13

local l_0_0 = mp.getfilesize()
if 256 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename()
if ".dat" ~= string.sub(l_0_1, -4) then
  return mp.CLEAN
end
local l_0_2 = headerpage[1]
if 170 ~= l_0_2 then
  return mp.CLEAN
end
l_0_2 = headerpage[2]
if 254 ~= l_0_2 then
  return mp.CLEAN
end
l_0_2 = headerpage[3]
if 14 ~= l_0_2 then
  return mp.CLEAN
end
return mp.INFECTED
