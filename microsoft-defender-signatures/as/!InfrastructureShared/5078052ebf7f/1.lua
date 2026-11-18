-- Threat: !InfrastructureShared
-- Name: 5078052ebf7f
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
