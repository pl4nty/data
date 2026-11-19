-- Threat: !InfrastructureShared
-- Name: 1537873774790
-- Type: 21

if peattributes.is_process or pehdr.NumberOfSections < 2 or pevars.epsec == 1 or pehdr.FileAlignment == 0 then
  return mp.CLEAN
end
if pevars.epsec > 0 and pehdr.AddressOfEntryPoint ~= pesecs[pevars.epsec].VirtualAddress then
  return mp.CLEAN
end
if mp.get_mpattribute("pea_lastscn_executable") and mp.get_mpattribute("pea_epatstartentrysect") and (epcode[1] == 104 and (epcode[6] == 232 or epcode[6] == 144) and epcode[11] == 233 or epcode[16] == 85 and epcode[17] == 139 and epcode[18] == 236 and epcode[19] == 129 or epcode[6] == 232 and epcode[7] == 5 and epcode[8] == 0 and epcode[9] == 0 and epcode[10] == 0 and epcode[11] == 0) and mp.bitand(epcode[15], 240) == 240 and pesecs[pevars.epsec].SizeOfRawData == pesecs[pevars.epsec].VirtualSize and 0 < pesecs[pevars.epsec].SizeOfRawData % pehdr.FileAlignment then
  return mp.INFECTED
end
return mp.CLEAN
