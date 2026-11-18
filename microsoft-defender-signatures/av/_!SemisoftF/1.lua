-- Threat: \xb0!Semisoft.F
-- Type: 8

if pevars.epsec > pehdr.NumberOfSections then
  return mp.CLEAN
end
if pesecs[pevars.epsec].SizeOfRawData ~= 40448 then
  return mp.CLEAN
end
if pehdr.AddressOfEntryPoint ~= 19968 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(pesecs[pevars.epsec].PointerToRawData + 1600, 1024)
local l_0_1 = mp.crc32(-1, l_0_0, 1, 1024)
if l_0_1 ~= 2106590491 then
  return mp.CLEAN
end
return mp.INFECTED
