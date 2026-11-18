-- Threat: !InfrastructureShared
-- Name: 1f7844d03547
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
