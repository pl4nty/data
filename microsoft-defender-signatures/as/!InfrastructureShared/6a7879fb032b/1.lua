-- Threat: !InfrastructureShared
-- Name: 6a7879fb032b
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
