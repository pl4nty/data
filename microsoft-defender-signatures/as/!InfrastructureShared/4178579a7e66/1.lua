-- Threat: !InfrastructureShared
-- Name: 4178579a7e66
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
