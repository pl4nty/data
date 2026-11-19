-- Threat: !InfrastructureShared
-- Name: 6278447dd4d1
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
