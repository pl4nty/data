-- Threat: !InfrastructureShared
-- Name: 15478b4e28bc8
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
