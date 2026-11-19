-- Threat: !InfrastructureShared
-- Name: 47782860beb8
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
