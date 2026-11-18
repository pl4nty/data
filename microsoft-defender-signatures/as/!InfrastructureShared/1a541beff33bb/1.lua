-- Threat: !InfrastructureShared
-- Name: 1a541beff33bb
-- Type: 21

if peattributes.isexe and peattributes.epinfirstsect and pehdr.NumberOfSections >= 3 and pehdr.NumberOfSections < 6 and pesecs[pehdr.NumberOfSections].Name == ".data0" and pesecs[pevars.epsec].SizeOfRawData == 512 then
  local l_0_0 = pe.mmap_rva(pesecs[pehdr.NumberOfSections].VirtualAddress + 4, 2)
  if l_0_0 == "MZ" then
    return mp.INFECTED
  end
end
return mp.CLEAN
