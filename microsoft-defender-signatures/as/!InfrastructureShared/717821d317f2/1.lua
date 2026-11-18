-- Threat: !InfrastructureShared
-- Name: 717821d317f2
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
