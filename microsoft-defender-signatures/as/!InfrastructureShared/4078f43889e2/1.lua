-- Threat: !InfrastructureShared
-- Name: 4078f43889e2
-- Type: 21

if peattributes.x86_image == true and peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
