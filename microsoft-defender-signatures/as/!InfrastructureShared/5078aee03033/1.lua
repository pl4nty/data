-- Threat: !InfrastructureShared
-- Name: 5078aee03033
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
