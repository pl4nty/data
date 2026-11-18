-- Threat: !InfrastructureShared
-- Name: 11f78249a6684
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
