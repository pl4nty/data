-- Threat: !InfrastructureShared
-- Name: !#Lua:SingleFileJARInZip
-- Type: 13
-- MpAttributes: Lua:JARExt

local l_0_0, l_0_1 = mp.UfsGetMetadataBool("Lua:SingleFileInZip", true)
if l_0_0 ~= 0 or not l_0_1 then
  return mp.CLEAN
end
return mp.INFECTED
