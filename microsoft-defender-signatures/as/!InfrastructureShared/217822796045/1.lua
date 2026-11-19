-- Threat: !InfrastructureShared
-- Name: 217822796045
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
