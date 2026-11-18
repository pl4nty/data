-- Threat: !InfrastructureShared
-- Name: 2a78a5edc6f5
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
