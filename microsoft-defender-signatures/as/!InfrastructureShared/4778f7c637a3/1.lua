-- Threat: !InfrastructureShared
-- Name: 4778f7c637a3
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
