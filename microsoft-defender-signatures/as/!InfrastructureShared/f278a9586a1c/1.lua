-- Threat: !InfrastructureShared
-- Name: f278a9586a1c
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
