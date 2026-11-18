-- Threat: !InfrastructureShared
-- Name: 53784f1ddec7
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
