-- Threat: !InfrastructureShared
-- Name: 9578f5f8c089
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
