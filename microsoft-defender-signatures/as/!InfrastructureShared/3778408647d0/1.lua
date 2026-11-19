-- Threat: !InfrastructureShared
-- Name: 3778408647d0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
