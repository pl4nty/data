-- Threat: !InfrastructureShared
-- Name: 92784bc8b659
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
