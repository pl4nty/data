-- Threat: !InfrastructureShared
-- Name: a478a5c0875c
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
