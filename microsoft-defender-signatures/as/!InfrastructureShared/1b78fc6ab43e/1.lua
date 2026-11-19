-- Threat: !InfrastructureShared
-- Name: 1b78fc6ab43e
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
