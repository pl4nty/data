-- Threat: !InfrastructureShared
-- Name: 3a78f5f36a9c
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and mp.getfilesize() < 458752 and pesecs[3].Name == ".data" and pesecs[3].Characteristics == 3221225536 then
  return mp.INFECTED
end
return mp.CLEAN
