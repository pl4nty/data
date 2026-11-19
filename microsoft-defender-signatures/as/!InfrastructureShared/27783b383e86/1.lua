-- Threat: !InfrastructureShared
-- Name: 27783b383e86
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
