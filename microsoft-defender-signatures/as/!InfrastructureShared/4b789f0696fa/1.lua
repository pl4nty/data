-- Threat: !InfrastructureShared
-- Name: 4b789f0696fa
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
