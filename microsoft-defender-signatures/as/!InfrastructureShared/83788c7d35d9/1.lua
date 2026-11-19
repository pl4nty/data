-- Threat: !InfrastructureShared
-- Name: 83788c7d35d9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
