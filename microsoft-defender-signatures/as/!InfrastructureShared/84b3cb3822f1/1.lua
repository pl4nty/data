-- Threat: !InfrastructureShared
-- Name: 84b3cb3822f1
-- Type: 21
-- Includes: BMLuaLib

if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN
