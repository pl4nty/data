-- Threat: !InfrastructureShared
-- Name: 4e78af94afe2
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
