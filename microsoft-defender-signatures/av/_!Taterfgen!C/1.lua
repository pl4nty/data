-- Threat: \xa4!Taterf.gen!C
-- Type: 8

if pehdr.MajorLinkerVersion ~= 6 then
  return mp.CLEAN
end
if pevars.epsec > pehdr.NumberOfSections then
  return mp.CLEAN
end
if pesecs[pevars.epsec].Characteristics ~= 3758096480 then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 3 then
  return mp.CLEAN
end
if peattributes.isexe ~= true then
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
if peattributes.headerchecksum0 ~= true then
  return mp.CLEAN
end
if pesecs[1].SizeOfRawData ~= 0 then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].VirtualSize > 4608 then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].VirtualSize < 256 then
  return mp.CLEAN
end
if pehdr.SizeOfImage < 147456 then
  return mp.CLEAN
end
if pehdr.SizeOfImage > 270336 then
  return mp.CLEAN
end
if pesecs[1].VirtualSize < 45056 then
  return mp.CLEAN
end
if pesecs[1].VirtualSize > 139264 then
  return mp.CLEAN
end
if pesecs[pevars.epsec].VirtualSize < 94208 then
  return mp.CLEAN
end
if pesecs[pevars.epsec].VirtualSize > 126976 then
  return mp.CLEAN
end
if epcode[1] == 232 then
  return mp.CLEAN
end
if epcode[1] == 85 then
  return mp.CLEAN
end
if epcode[1] == 104 then
  return mp.CLEAN
end
return mp.INFECTED
