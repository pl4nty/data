-- Threat: !InfrastructureShared
-- Name: a9787aab59d8
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 15000 and peattributes.no_security == true and pesecs[1].Name == "AUTO" and pehdr.AddressOfEntryPoint == 0 then
  return mp.INFECTED
end
return mp.CLEAN
