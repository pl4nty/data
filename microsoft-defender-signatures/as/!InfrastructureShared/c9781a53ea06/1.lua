-- Threat: !InfrastructureShared
-- Name: c9781a53ea06
-- Type: 21

if peattributes.no_security and peattributes.isdll and mp.getfilesize() < 14288 then
  return mp.INFECTED
end
return mp.CLEAN
