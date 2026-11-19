-- Threat: !InfrastructureShared
-- Name: 81780d495194
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
