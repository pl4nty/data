-- Threat: !InfrastructureShared
-- Name: 727855a311e6
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
