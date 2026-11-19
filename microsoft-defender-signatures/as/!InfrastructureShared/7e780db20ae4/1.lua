-- Threat: !InfrastructureShared
-- Name: 7e780db20ae4
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
