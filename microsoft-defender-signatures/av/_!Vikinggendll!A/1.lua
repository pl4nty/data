-- Threat: \xb0!Viking.gen.dll!A
-- Type: 8

if pehdr.NumberOfSections < 3 then
  return mp.CLEAN
end
if peattributes.isdll ~= true then
  return mp.CLEAN
end
if pesecs[1].VirtualSize ~= 40960 then
  return mp.CLEAN
end
if pesecs[1].SizeOfRawData ~= 0 then
  return mp.CLEAN
end
if pesecs[1].PointerToRawData ~= 512 then
  return mp.CLEAN
end
if pevars.epsec > pehdr.NumberOfSections then
  return mp.CLEAN
end
if pesecs[pevars.epsec].PointerToRawData ~= 512 then
  return mp.CLEAN
end
if pesecs[1].VirtualAddress ~= 4096 then
  return mp.CLEAN
end
if peattributes.lastscn_writable ~= true then
  return mp.CLEAN
end
if peattributes.epscn_writable ~= true then
  return mp.CLEAN
end
if peattributes.firstsectwritable ~= true then
  return mp.CLEAN
end
if pehdr.DataDirectory[3].RVA ~= 45056 then
  return mp.CLEAN
end
if pesecs[pevars.epsec].VirtualSize < 28672 then
  return mp.CLEAN
end
if 40960 < pesecs[pevars.epsec].VirtualSize then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(512, 1024)
local l_0_1 = mp.crc32(-1, l_0_0, 1, 1024)
if l_0_1 ~= 1093127814 then
  return mp.CLEAN
end
return mp.INFECTED
