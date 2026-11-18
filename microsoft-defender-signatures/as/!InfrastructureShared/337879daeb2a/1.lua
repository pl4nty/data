-- Threat: !InfrastructureShared
-- Name: 337879daeb2a
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
