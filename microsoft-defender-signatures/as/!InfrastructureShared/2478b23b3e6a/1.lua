-- Threat: !InfrastructureShared
-- Name: 2478b23b3e6a
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
