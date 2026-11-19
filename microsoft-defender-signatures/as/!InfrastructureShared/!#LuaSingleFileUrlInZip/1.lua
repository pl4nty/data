-- Threat: !InfrastructureShared
-- Name: !#Lua:SingleFileUrlInZip
-- Type: 13

local l_0_0 = string.lower(string.sub(mp.getfilename(), -3))
if l_0_0 ~= "url" then
  return mp.CLEAN
end
local l_0_1, l_0_2 = mp.UfsGetMetadataBool("Lua:SingleFileInZip", true)
if l_0_1 ~= 0 or not l_0_2 then
  return mp.CLEAN
end
return mp.INFECTED
