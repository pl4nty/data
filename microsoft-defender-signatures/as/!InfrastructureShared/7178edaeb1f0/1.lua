-- Threat: !InfrastructureShared
-- Name: 7178edaeb1f0
-- Type: 21

if peattributes.isexe == true and epcode[1] == 104 and epcode[2] == 15 and peattributes.hasexports == true and pehdr.AddressOfEntryPoint == 12647710 and pesecs[4].Name == ".data020" and pesecs[5].Name == ".data021" and mp.getfilesize() >= 6000000 and mp.getfilesize() <= 7000000 then
  return mp.INFECTED
end
return mp.CLEAN
