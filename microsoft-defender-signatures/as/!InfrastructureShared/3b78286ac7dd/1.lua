-- Threat: !InfrastructureShared
-- Name: 3b78286ac7dd
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
