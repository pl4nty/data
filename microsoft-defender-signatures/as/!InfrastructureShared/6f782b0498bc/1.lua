-- Threat: !InfrastructureShared
-- Name: 6f782b0498bc
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
