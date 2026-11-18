-- Threat: !InfrastructureShared
-- Name: 16f7825302065
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true and mp.getfilesize() < 200000 and pesecs[3].Name == ".data" and pesecs[3].Characteristics == 3221225536 then
  return mp.INFECTED
end
return mp.CLEAN
