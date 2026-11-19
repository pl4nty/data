-- Threat: !InfrastructureShared
-- Name: 49789c2b4488
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
