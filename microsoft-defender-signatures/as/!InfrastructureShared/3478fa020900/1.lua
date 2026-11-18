-- Threat: !InfrastructureShared
-- Name: 3478fa020900
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
