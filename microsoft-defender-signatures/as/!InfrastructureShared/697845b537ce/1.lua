-- Threat: !InfrastructureShared
-- Name: 697845b537ce
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
