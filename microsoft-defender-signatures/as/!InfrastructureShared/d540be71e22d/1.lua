-- Threat: !InfrastructureShared
-- Name: d540be71e22d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
