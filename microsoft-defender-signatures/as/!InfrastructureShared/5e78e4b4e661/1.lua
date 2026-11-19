-- Threat: !InfrastructureShared
-- Name: 5e78e4b4e661
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
