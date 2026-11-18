-- Threat: !InfrastructureShared
-- Name: 4c78949e0957
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
