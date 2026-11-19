-- Threat: !InfrastructureShared
-- Name: 4b78e3600260
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
