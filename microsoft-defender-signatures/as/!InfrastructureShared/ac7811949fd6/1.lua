-- Threat: !InfrastructureShared
-- Name: ac7811949fd6
-- Type: 21

if peattributes.isexe and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
