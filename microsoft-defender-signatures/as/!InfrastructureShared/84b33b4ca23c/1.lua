-- Threat: !InfrastructureShared
-- Name: 84b33b4ca23c
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
