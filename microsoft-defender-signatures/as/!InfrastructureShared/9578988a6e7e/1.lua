-- Threat: !InfrastructureShared
-- Name: 9578988a6e7e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
