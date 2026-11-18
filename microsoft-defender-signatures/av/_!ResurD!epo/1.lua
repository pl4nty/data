-- Threat: \xb0!Resur.D!epo
-- Type: 8

if mp.bitand(pehdr.ImageBase, 3204448256) ~= 3204448256 then
  return mp.CLEAN
end
if peattributes.no_relocs ~= false then
  return mp.CLEAN
end
if pevars.epsec > pehdr.NumberOfSections then
  return mp.CLEAN
end
if pesecs[pevars.epsec].SizeOfRawData ~= 4096 then
  return mp.CLEAN
end
if pesecs[pevars.epsec].VirtualSize ~= 3612 then
  return mp.CLEAN
end
if pehdr.NumberOfSections <= 4 then
  return mp.CLEAN
end
if mp.bitand(pehdr.Characteristics, 8192) == 8192 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(pe.foffset_rva(pehdr.DataDirectory[6].RVA), 1040)
local l_0_1 = mp.crc32(-1, l_0_0, 17, 1024)
if l_0_1 ~= 254301721 then
  return mp.CLEAN
end
return mp.INFECTED
