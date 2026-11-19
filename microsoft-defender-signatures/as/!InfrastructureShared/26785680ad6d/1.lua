-- Threat: !InfrastructureShared
-- Name: 26785680ad6d
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
