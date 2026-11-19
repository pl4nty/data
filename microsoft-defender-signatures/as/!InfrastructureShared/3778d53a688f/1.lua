-- Threat: !InfrastructureShared
-- Name: 3778d53a688f
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
