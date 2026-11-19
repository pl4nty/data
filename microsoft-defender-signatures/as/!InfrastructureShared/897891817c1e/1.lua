-- Threat: !InfrastructureShared
-- Name: 897891817c1e
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
