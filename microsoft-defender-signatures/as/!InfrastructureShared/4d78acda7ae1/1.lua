-- Threat: !InfrastructureShared
-- Name: 4d78acda7ae1
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
