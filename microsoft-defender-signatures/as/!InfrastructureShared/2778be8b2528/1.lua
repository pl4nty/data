-- Threat: !InfrastructureShared
-- Name: 2778be8b2528
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true and pesecs[4].Name == ".fptable" and pesecs[4].Characteristics == 3221225536 and mp.getfilesize() >= 5000000 and mp.getfilesize() <= 20000000 then
  return mp.INFECTED
end
return mp.CLEAN
