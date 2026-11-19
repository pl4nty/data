-- Threat: !InfrastructureShared
-- Name: 50788244df41
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
