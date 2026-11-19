-- Threat: !InfrastructureShared
-- Name: 4678829a2160
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
