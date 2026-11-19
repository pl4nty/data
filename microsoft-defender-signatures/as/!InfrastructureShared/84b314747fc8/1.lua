-- Threat: !InfrastructureShared
-- Name: 84b314747fc8
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
