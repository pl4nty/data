-- Threat: !InfrastructureShared
-- Name: 4c786acd718d
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
