-- Threat: !InfrastructureShared
-- Name: 83785d144510
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
