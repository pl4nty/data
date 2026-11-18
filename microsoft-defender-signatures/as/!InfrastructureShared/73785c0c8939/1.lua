-- Threat: !InfrastructureShared
-- Name: 73785c0c8939
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
