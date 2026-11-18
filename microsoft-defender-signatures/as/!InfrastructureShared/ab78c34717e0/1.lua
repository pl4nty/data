-- Threat: !InfrastructureShared
-- Name: ab78c34717e0
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
