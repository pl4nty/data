-- Threat: !InfrastructureShared
-- Name: 9078c19268d3
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
