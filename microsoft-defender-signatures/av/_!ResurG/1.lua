-- Threat: \xb0!Resur.G
-- Type: 8

if pevars.epsec > pehdr.NumberOfSections then
  return mp.CLEAN
end
if pesecs[pevars.epsec].SizeOfRawData ~= 77824 then
  return mp.CLEAN
end
if mp.bitand(pesecs[pevars.epsec].VirtualSize, 73728) ~= 73728 then
  return mp.CLEAN
end
if pesecs[pevars.epsec].Characteristics ~= 1610612768 then
  return mp.CLEAN
end
if pehdr.NumberOfSections <= 4 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(pesecs[pevars.epsec].PointerToRawData + 256, 256)
local l_0_1 = mp.crc32(-1, l_0_0, 1, 29)
if l_0_1 ~= 3571610125 then
  return mp.CLEAN
end
local l_0_2 = mp.crc32(-1, l_0_0, 96, 16)
if l_0_2 ~= 1775081905 then
  return mp.CLEAN
end
return mp.INFECTED
