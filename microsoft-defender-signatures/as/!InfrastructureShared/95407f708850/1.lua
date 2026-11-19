-- Threat: !InfrastructureShared
-- Name: 95407f708850
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
