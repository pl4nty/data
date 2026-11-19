-- Threat: \xb0AVulcano!epo
-- Type: 8

if peattributes.lastscn_writable == false then
  return mp.CLEAN
end
if peattributes.lastscn_falign == false then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].SizeOfRawData < 6656 then
  return mp.CLEAN
end
if not mp.bitand(pehdr.MajorImageVersion, 1) == 0 then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "`\232\000\000\000\000]\141\181\198\000\000\000\141\189\244",
    xray_type = 8,
    bytes_to_decrypt = 0
  },
  {
    sig = "`\232\000\000\000\000]\141\181\198\000\000\000\141\189\254",
    xray_type = 8,
    bytes_to_decrypt = 0
  }
}
return pe.xray_block(l_0_0, 2, -1, 0, 256)
