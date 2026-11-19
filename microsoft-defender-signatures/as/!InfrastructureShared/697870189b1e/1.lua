-- Threat: !InfrastructureShared
-- Name: 697870189b1e
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
