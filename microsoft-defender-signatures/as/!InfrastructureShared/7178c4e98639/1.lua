-- Threat: !InfrastructureShared
-- Name: 7178c4e98639
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
