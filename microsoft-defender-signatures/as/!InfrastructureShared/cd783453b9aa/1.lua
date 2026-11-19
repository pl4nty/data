-- Threat: !InfrastructureShared
-- Name: cd783453b9aa
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
