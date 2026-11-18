-- Threat: !InfrastructureShared
-- Name: 277841d6c366
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
