-- Threat: !InfrastructureShared
-- Name: 84b3dfffd43d
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
