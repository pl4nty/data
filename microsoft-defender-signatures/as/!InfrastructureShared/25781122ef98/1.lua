-- Threat: !InfrastructureShared
-- Name: 25781122ef98
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
