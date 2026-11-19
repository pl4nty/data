-- Threat: !InfrastructureShared
-- Name: 2b782507fa3f
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and pesecs[3].Name == ".data" and pesecs[3].Characteristics == 3221225536 then
  return mp.INFECTED
end
return mp.CLEAN
