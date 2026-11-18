-- Threat: \xb01Harrier
-- Type: 8

if peattributes.lastscn_writable == false then
  return mp.CLEAN
end
if peattributes.epscn_islast == false then
  return mp.CLEAN
end
if peattributes.epatscnstart == false then
  return mp.CLEAN
end
if pevars.epsec > pehdr.NumberOfSections then
  return mp.CLEAN
end
if pesecs[pevars.epsec].SizeOfRawData <= 94208 then
  return mp.CLEAN
end
if 94208 >= pesecs[pevars.epsec].VirtualSize then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(pe.foffset_rva(pehdr.DataDirectory[2].RVA - 490), 256)
local l_0_1 = mp.crc32(-1, l_0_0, 1, 256)
if l_0_1 ~= 4123414866 then
  return mp.CLEAN
end
return mp.INFECTED
