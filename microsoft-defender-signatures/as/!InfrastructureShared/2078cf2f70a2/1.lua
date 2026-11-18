-- Threat: !InfrastructureShared
-- Name: 2078cf2f70a2
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
