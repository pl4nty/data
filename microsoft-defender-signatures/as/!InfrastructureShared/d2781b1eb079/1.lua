-- Threat: !InfrastructureShared
-- Name: d2781b1eb079
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
