-- Threat: \xb0!Toal.A@mm!epo
-- Type: 8

if peattributes.lastscn_falign == false then
  return mp.CLEAN
end
if peattributes.lastscn_valign == false then
  return mp.CLEAN
end
if mp.getfilesize() < 24576 then
  return mp.CLEAN
end
if pehdr.NumberOfSections == 0 then
  return mp.CLEAN
end
if pehdr.SizeOfImage < 61440 then
  return mp.CLEAN
end
if mp.bitand(pehdr.Characteristics, 8192) == 8192 then
  return mp.CLEAN
end
if 61440 > pesecs[pehdr.NumberOfSections].SizeOfRawData then
  return mp.CLEAN
end
if 61440 > pesecs[pehdr.NumberOfSections].VirtualSize then
  return mp.CLEAN
end
if string.find(mp.getfilename(), "->[CeeInject_KK_DynExe]", 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "`\000",
    xray_type = 19,
    bytes_to_decrypt = 0
  }
}
return pe.xray_block(l_0_0, 1, -1, -73728, -65536)
