-- Threat: !InfrastructureShared
-- Name: fd78e11e3904
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
