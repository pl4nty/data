-- Threat: !InfrastructureShared
-- Name: bf782b13670e
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
