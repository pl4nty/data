-- Threat: !InfrastructureShared
-- Name: 8778396a022f
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
