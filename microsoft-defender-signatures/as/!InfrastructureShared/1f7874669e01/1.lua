-- Threat: !InfrastructureShared
-- Name: 1f7874669e01
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
