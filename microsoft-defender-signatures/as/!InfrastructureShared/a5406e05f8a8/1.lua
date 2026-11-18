-- Threat: !InfrastructureShared
-- Name: a5406e05f8a8
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
