-- Threat: !InfrastructureShared
-- Name: 48787e043ec4
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
