-- Threat: !InfrastructureShared
-- Name: 26788bb7d47d
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
