-- Threat: !InfrastructureShared
-- Name: !#Lua:Rebhip_Config!B
-- Type: 13

if not mp.get_mpattribute("SCPT:Rebhip_Config!B") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 < 50000 or 500000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = headerpage[1]
if 67 ~= l_0_1 and 99 ~= l_0_1 then
  return mp.CLEAN
end
l_0_1 = headerpage[2]
if 58 ~= l_0_1 then
  return mp.CLEAN
end
l_0_1 = headerpage[3]
if 92 ~= l_0_1 then
  return mp.CLEAN
end
return mp.INFECTED
