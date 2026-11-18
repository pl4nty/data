-- Threat: !InfrastructureShared
-- Name: 4e785c3a70d5
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
