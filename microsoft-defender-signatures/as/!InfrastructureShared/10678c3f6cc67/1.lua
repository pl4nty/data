-- Threat: !InfrastructureShared
-- Name: 10678c3f6cc67
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
