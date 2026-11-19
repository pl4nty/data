-- Threat: !InfrastructureShared
-- Name: 7978af1454bd
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
