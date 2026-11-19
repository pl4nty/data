-- Threat: !InfrastructureShared
-- Name: 93787aef6802
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
