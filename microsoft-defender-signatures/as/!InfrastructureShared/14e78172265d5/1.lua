-- Threat: !InfrastructureShared
-- Name: 14e78172265d5
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
