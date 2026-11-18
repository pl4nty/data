-- Threat: !InfrastructureShared
-- Name: 627879d05a6b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
