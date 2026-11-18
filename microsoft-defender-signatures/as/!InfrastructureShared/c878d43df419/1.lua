-- Threat: !InfrastructureShared
-- Name: c878d43df419
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
