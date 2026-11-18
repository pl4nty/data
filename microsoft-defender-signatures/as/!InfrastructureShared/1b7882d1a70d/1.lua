-- Threat: !InfrastructureShared
-- Name: 1b7882d1a70d
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
