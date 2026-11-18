-- Threat: !InfrastructureShared
-- Name: 3278425c0b40
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
