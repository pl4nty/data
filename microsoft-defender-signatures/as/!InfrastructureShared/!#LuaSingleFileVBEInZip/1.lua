-- Threat: !InfrastructureShared
-- Name: !#Lua:SingleFileVBEInZip
-- Type: 13

if not mp.get_mpattribute("PACKED_WITH:(EncScript)") then
  return mp.CLEAN
end
local l_0_0, l_0_1 = mp.UfsGetMetadataBool("Lua:SingleFileInZip", true)
if l_0_0 ~= 0 or not l_0_1 then
  return mp.CLEAN
end
return mp.INFECTED
