-- Threat: !InfrastructureShared
-- Name: 2478c28f4e7b
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
