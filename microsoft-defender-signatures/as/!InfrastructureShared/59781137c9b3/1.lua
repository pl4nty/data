-- Threat: !InfrastructureShared
-- Name: 59781137c9b3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
