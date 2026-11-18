-- Threat: !InfrastructureShared
-- Name: 5f7844ea6dfc
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
