-- Threat: !InfrastructureShared
-- Name: 13f7893757fe8
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
