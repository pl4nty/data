-- Threat: !InfrastructureShared
-- Name: 43783a04fd80
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
