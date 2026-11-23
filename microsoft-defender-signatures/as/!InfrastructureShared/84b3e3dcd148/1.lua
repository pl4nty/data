-- Threat: !InfrastructureShared
-- Name: 84b3e3dcd148
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
