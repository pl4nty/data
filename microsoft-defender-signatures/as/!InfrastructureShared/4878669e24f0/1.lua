-- Threat: !InfrastructureShared
-- Name: 4878669e24f0
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
