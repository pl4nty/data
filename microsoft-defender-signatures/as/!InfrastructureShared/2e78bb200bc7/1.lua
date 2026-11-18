-- Threat: !InfrastructureShared
-- Name: 2e78bb200bc7
-- Type: 21

if peattributes.isdll or peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
