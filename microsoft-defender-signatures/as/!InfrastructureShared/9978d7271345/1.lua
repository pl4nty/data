-- Threat: !InfrastructureShared
-- Name: 9978d7271345
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
