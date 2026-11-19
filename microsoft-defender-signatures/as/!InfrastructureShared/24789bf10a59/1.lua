-- Threat: !InfrastructureShared
-- Name: 24789bf10a59
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
