-- Threat: !InfrastructureShared
-- Name: 36785d99c591
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
