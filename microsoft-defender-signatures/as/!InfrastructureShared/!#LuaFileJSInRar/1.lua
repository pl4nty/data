-- Threat: !InfrastructureShared
-- Name: !#Lua:FileJSInRar
-- Type: 13
-- MpAttributes: Lua:JSExt

local l_0_0, l_0_1 = mp.UfsGetMetadataBool("Lua:FileInRar", true)
if l_0_0 ~= 0 or not l_0_1 then
  return mp.CLEAN
end
return mp.INFECTED
