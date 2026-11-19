-- Threat: !InfrastructureShared
-- Name: 43785c3a6dc9
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
