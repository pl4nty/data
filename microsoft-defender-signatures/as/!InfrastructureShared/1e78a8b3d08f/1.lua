-- Threat: !InfrastructureShared
-- Name: 1e78a8b3d08f
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
