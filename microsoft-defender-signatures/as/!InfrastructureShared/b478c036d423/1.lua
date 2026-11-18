-- Threat: !InfrastructureShared
-- Name: b478c036d423
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
