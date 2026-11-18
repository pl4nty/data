-- Threat: !InfrastructureShared
-- Name: 2578d33e75f3
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
