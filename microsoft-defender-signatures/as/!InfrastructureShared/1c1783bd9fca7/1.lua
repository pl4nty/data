-- Threat: !InfrastructureShared
-- Name: 1c1783bd9fca7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
