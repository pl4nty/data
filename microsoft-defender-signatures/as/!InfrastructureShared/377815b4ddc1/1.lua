-- Threat: !InfrastructureShared
-- Name: 377815b4ddc1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
