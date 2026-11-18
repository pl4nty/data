-- Threat: !InfrastructureShared
-- Name: a178145ee95a
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
