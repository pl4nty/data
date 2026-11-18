-- Threat: !InfrastructureShared
-- Name: 84b3aa3ff7ce
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
