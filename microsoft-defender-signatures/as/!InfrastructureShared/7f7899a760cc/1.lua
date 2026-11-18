-- Threat: !InfrastructureShared
-- Name: 7f7899a760cc
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
