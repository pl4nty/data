-- Threat: !InfrastructureShared
-- Name: 5778baf0f0d3
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
