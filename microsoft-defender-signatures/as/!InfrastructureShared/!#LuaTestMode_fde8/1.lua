-- Threat: !InfrastructureShared
-- Name: !#Lua:TestMode_fde8
-- Type: 12
-- Includes: LuaFuncHelper

if mp.get_mpattribute("Lua:TestMode_fde8") then
  return mp.CLEAN
end
AddToAtomicCounter("TestMode_fde8", 1, 3600)
return mp.INFECTED
