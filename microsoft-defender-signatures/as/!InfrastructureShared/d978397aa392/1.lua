-- Threat: !InfrastructureShared
-- Name: d978397aa392
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
