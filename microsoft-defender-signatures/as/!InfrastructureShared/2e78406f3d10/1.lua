-- Threat: !InfrastructureShared
-- Name: 2e78406f3d10
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
