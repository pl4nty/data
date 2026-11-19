-- Threat: !InfrastructureShared
-- Name: 3178affc7966
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
