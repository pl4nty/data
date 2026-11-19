-- Threat: !InfrastructureShared
-- Name: 4f78316e15bc
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
