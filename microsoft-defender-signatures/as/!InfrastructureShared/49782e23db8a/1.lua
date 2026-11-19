-- Threat: !InfrastructureShared
-- Name: 49782e23db8a
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
