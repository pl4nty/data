-- Threat: !InfrastructureShared
-- Name: 927866723734
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
