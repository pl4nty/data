-- Threat: !InfrastructureShared
-- Name: 23781c02e1d3
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
