-- Threat: !InfrastructureShared
-- Name: 6540f14214ff
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
