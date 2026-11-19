-- Threat: !InfrastructureShared
-- Name: !#Lua:FileInZip
-- Type: 13

local l_0_0, l_0_1 = mp.UfsGetMetadataBool("Lua:FileInZip", true)
if l_0_0 == 0 and l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
