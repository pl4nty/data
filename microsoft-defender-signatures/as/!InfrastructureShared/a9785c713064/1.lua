-- Threat: !InfrastructureShared
-- Name: a9785c713064
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
