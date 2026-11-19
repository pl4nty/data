-- Threat: !InfrastructureShared
-- Name: 6678fc66c4ed
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
