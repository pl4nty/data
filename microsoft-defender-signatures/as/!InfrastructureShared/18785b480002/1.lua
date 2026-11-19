-- Threat: !InfrastructureShared
-- Name: 18785b480002
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
