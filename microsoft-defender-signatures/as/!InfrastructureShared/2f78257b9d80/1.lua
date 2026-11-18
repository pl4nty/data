-- Threat: !InfrastructureShared
-- Name: 2f78257b9d80
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
