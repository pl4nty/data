-- Threat: !InfrastructureShared
-- Name: 20778a3dd6762
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
