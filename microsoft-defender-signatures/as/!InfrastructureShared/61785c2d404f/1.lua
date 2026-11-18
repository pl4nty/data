-- Threat: !InfrastructureShared
-- Name: 61785c2d404f
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
