-- Threat: !InfrastructureShared
-- Name: 4178de42ac40
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
