-- Threat: !InfrastructureShared
-- Name: 46787d70eb1f
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
