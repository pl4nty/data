-- Threat: !InfrastructureShared
-- Name: 4f78138d4e13
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
