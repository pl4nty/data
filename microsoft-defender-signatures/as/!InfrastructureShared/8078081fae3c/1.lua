-- Threat: !InfrastructureShared
-- Name: 8078081fae3c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
