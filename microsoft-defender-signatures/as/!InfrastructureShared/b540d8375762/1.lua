-- Threat: !InfrastructureShared
-- Name: b540d8375762
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
