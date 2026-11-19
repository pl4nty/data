-- Threat: !InfrastructureShared
-- Name: 3a782273f04f
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
