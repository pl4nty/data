-- Threat: !InfrastructureShared
-- Name: 3378de9f3c0c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
