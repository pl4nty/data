-- Threat: \xb0!Fosforo!epo
-- Type: 8

if doshdr.e_csum ~= 85 then
  return mp.CLEAN
end
if pehdr.ImageBase ~= 4194304 then
  return mp.CLEAN
end
if mp.getfilesize() >= 409600 then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].SizeOfRawData < 7000 then
  return mp.CLEAN
end
if 7000 > pesecs[pehdr.NumberOfSections].VirtualSize then
  return mp.CLEAN
end
if pehdr.NumberOfSections <= 3 then
  return mp.CLEAN
end
if 7000 > pehdr.SizeOfImage then
  return mp.CLEAN
end
if peattributes.lastscn_writable == false then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "\232\000\000\000\000\144]\129\237\005 @\000\129\189\0280@\000OMEMt",
    xray_type = 4,
    bytes_to_decrypt = 0
  },
  {
    sig = "\232\000\000\000\000]\129\237\005 @\000\129\189H.@\000OMEMt<",
    xray_type = 4,
    bytes_to_decrypt = 0
  },
  {
    sig = "\232\000\000\000\000]\129\237\005 @\000\129\189\217.@\000OMEMt<",
    xray_type = 4,
    bytes_to_decrypt = 0
  },
  {
    sig = "\232\000\000\000\000]\129\237\005 @\000\129\189\231.@\000OMEMt<",
    xray_type = 4,
    bytes_to_decrypt = 0
  }
}
return pe.xray_block(l_0_0, 4, -1, -12288, -128)
