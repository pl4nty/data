-- Threat: !InfrastructureShared
-- Name: b9787aedd033
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
