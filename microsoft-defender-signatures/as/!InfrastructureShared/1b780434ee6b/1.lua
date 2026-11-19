-- Threat: !InfrastructureShared
-- Name: 1b780434ee6b
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
