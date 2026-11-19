-- Threat: !InfrastructureShared
-- Name: 12540867c8e7d
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
