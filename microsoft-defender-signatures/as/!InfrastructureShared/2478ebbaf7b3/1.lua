-- Threat: !InfrastructureShared
-- Name: 2478ebbaf7b3
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
