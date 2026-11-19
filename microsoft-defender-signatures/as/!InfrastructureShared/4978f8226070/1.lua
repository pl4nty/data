-- Threat: !InfrastructureShared
-- Name: 4978f8226070
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
