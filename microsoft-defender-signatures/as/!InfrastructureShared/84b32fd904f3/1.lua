-- Threat: !InfrastructureShared
-- Name: 84b32fd904f3
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
