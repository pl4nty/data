-- Threat: !InfrastructureShared
-- Name: ffb33d50cb92
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
