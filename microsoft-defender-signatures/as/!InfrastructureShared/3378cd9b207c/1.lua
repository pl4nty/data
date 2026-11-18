-- Threat: !InfrastructureShared
-- Name: 3378cd9b207c
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
