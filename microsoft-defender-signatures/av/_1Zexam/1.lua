-- Threat: \xb01Zexam
-- Type: 8

if peattributes.lastscn_falign == false then
  return mp.CLEAN
end
if peattributes.lastscn_valign == false then
  return mp.CLEAN
end
if pehdr.MinorImageVersion ~= 100 then
  return mp.CLEAN
end
if pehdr.NumberOfSections == 0 then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].SizeOfRawData < 262144 then
  return mp.CLEAN
end
if 262144 > pesecs[pehdr.NumberOfSections].VirtualSize then
  return mp.CLEAN
end
if 262144 > pehdr.SizeOfCode then
  return mp.CLEAN
end
if 262144 > pehdr.SizeOfImage then
  return mp.CLEAN
end
if mp.bitand(pehdr.Characteristics, 8192) == 8192 then
  return mp.CLEAN
end
if pehdr.SizeOfStackReserve < 4194304 then
  return mp.CLEAN
end
if 4194304 > pehdr.SizeOfHeapReserve then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "\000",
    xray_type = 19,
    bytes_to_decrypt = 0
  }
}
return pe.xray_block(l_0_0, 1, -1, -262144, -258048)
