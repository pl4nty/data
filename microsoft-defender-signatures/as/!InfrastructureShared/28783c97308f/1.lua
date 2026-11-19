-- Threat: !InfrastructureShared
-- Name: 28783c97308f
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
