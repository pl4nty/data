-- Threat: !InfrastructureShared
-- Name: 5378a8f6e8bb
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
