-- Threat: !InfrastructureShared
-- Name: 54785e5ac38a
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
