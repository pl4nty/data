-- Threat: !InfrastructureShared
-- Name: 26783c29fefd
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
