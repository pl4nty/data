-- Threat: !InfrastructureShared
-- Name: 4d784ebcfc1f
-- Type: 21

if peattributes.isexe == true and pehdr.AddressOfEntryPoint == 5088 and pesecs[7].Name == ".idata" and pesecs[7].Characteristics == 3221225536 and pesecs[9].Name == ".tls" and pesecs[9].Characteristics == 3221225536 and mp.getfilesize() <= 500000 then
  return mp.INFECTED
end
return mp.CLEAN
