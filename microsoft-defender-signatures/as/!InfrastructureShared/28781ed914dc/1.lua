-- Threat: !InfrastructureShared
-- Name: 28781ed914dc
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
