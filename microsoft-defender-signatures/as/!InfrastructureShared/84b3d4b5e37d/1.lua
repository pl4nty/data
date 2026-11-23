-- Threat: !InfrastructureShared
-- Name: 84b3d4b5e37d
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
