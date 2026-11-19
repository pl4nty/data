-- Threat: !InfrastructureShared
-- Name: !#Lua:FileExeInRar
-- Type: 13
-- MpAttributes: Lua:EXEExt

local l_0_0, l_0_1 = mp.UfsGetMetadataBool("Lua:FileInRar", true)
if l_0_0 ~= 0 or not l_0_1 then
  return mp.CLEAN
end
return mp.INFECTED
