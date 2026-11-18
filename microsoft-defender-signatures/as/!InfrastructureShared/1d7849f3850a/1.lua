-- Threat: !InfrastructureShared
-- Name: 1d7849f3850a
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
