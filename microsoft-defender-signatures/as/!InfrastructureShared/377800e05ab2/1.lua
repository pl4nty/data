-- Threat: !InfrastructureShared
-- Name: 377800e05ab2
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
