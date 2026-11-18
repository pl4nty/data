-- Threat: !InfrastructureShared
-- Name: 40784c4c25e3
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
