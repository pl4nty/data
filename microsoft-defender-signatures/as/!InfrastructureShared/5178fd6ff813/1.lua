-- Threat: !InfrastructureShared
-- Name: 5178fd6ff813
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
