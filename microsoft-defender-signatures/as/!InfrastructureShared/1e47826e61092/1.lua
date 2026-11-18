-- Threat: !InfrastructureShared
-- Name: 1e47826e61092
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
