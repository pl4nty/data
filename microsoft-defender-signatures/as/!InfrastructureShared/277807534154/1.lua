-- Threat: !InfrastructureShared
-- Name: 277807534154
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
