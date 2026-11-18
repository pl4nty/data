-- Threat: !InfrastructureShared
-- Name: 10a7852e88561
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
