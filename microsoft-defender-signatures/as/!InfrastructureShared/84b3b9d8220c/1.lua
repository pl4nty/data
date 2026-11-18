-- Threat: !InfrastructureShared
-- Name: 84b3b9d8220c
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
