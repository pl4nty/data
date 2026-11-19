-- Threat: !InfrastructureShared
-- Name: 6678d8cb6bb8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
