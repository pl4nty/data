-- Threat: !InfrastructureShared
-- Name: 9578e2ecde53
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
