-- Threat: !InfrastructureShared
-- Name: 6f787949ed47
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
