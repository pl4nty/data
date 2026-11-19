-- Threat: !InfrastructureShared
-- Name: !#Lua:FileSizeLT2000
-- Type: 12

local l_0_0 = mp.getfilesize()
if l_0_0 < 2000 then
  return mp.INFECTED
end
return mp.CLEAN
