-- Threat: !InfrastructureShared
-- Name: 6e785edc2819
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
