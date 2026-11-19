-- Threat: !InfrastructureShared
-- Name: 247f419b6f05
-- Type: 21

if epcode[1] == 232 and epcode[6] == 232 and epcode[11] == 51 and epcode[13] == 195 and pevars.lscnwr == 1 and pesecs[pehdr.NumberOfSections].PointerToRawData == 45056 then
  return mp.INFECTED
end
return mp.CLEAN
