-- Threat: !InfrastructureShared
-- Name: 84b3c3af5bfd
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
