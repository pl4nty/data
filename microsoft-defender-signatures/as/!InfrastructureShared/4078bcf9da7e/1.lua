-- Threat: !InfrastructureShared
-- Name: 4078bcf9da7e
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
