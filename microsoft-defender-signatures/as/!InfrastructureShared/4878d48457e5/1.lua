-- Threat: !InfrastructureShared
-- Name: 4878d48457e5
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
