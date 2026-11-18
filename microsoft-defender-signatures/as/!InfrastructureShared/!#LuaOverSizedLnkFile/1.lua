-- Threat: !InfrastructureShared
-- Name: !#Lua:OverSizedLnkFile
-- Type: 12

local l_0_0 = mp.getfilesize()
if 204800 < l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
