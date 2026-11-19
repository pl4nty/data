-- Threat: !InfrastructureShared
-- Name: da78e3c36548
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
