-- Threat: !InfrastructureShared
-- Name: 2878eb1a6cbf
-- Type: 21

if peattributes.executes_from_dynamic_memory then
  return mp.INFECTED
end
return mp.CLEAN
