-- Threat: !InfrastructureShared
-- Name: 84b37b372095
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
