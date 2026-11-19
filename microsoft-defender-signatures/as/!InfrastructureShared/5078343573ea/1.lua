-- Threat: !InfrastructureShared
-- Name: 5078343573ea
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
