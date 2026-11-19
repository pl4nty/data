-- Threat: !InfrastructureShared
-- Name: 2978f1980c04
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
