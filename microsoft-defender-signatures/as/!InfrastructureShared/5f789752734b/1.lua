-- Threat: !InfrastructureShared
-- Name: 5f789752734b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
