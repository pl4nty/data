-- Threat: !InfrastructureShared
-- Name: b278a32cc4d6
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
