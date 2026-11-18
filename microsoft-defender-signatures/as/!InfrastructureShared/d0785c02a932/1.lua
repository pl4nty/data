-- Threat: !InfrastructureShared
-- Name: d0785c02a932
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
