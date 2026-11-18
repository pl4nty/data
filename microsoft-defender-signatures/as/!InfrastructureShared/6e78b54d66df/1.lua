-- Threat: !InfrastructureShared
-- Name: 6e78b54d66df
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and pesecs[3].Name == ".data" and pesecs[3].Characteristics == 3221225536 then
  return mp.INFECTED
end
return mp.CLEAN
