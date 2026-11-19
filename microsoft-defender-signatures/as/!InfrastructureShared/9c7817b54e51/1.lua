-- Threat: !InfrastructureShared
-- Name: 9c7817b54e51
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
