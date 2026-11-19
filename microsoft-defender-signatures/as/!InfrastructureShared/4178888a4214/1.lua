-- Threat: !InfrastructureShared
-- Name: 4178888a4214
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
