-- Threat: !InfrastructureShared
-- Name: 4778da18272c
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
