-- Threat: !InfrastructureShared
-- Name: 5878ae83f8a2
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
