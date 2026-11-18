-- Threat: !InfrastructureShared
-- Name: d6780c0179bc
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
