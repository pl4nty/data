-- Threat: !InfrastructureShared
-- Name: 84b3ca27e82c
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
