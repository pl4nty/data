-- Threat: !InfrastructureShared
-- Name: 84b38ee0265a
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
