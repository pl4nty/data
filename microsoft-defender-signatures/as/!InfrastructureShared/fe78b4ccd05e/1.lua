-- Threat: !InfrastructureShared
-- Name: fe78b4ccd05e
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
