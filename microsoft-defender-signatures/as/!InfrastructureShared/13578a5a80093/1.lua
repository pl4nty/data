-- Threat: !InfrastructureShared
-- Name: 13578a5a80093
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
