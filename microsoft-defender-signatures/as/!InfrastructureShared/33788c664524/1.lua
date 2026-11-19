-- Threat: !InfrastructureShared
-- Name: 33788c664524
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
