-- Threat: !InfrastructureShared
-- Name: !#Lua:HtaInsideZip
-- Type: 13
-- MpAttributes: Lua:HTAExt

local l_0_0, l_0_1 = mp.UfsGetMetadataBool("Lua:FileInZip", true)
if l_0_0 ~= 0 or not l_0_1 then
  return mp.CLEAN
end
return mp.INFECTED
