-- Threat: \xb0!Legacy!epo
-- Type: 8

if peattributes.lastscn_writable == false then
  return mp.CLEAN
end
if peattributes.no_relocs == false then
  return mp.CLEAN
end
if pehdr.Win32VersionValue ~= 1497581388 then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].SizeOfRawData <= 12000 then
  return mp.CLEAN
end
if 12000 >= pesecs[pehdr.NumberOfSections].VirtualSize then
  return mp.CLEAN
end
if pehdr.Machine ~= 332 then
  return mp.CLEAN
end
if peattributes.epscn_islast ~= false then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "\232\000\000\000\000]\139\197\129\237\194\024@\000-\153\b\000\000-",
    xray_type = 1,
    bytes_to_decrypt = 0
  },
  {
    sig = "\232\000\000\000\000]\139\197\129\237\194\024@\000-\153\b\000\000-",
    xray_type = 1,
    bytes_to_decrypt = 0
  },
  {
    sig = "\232\000\000\000\000]\139\197\129\237\194\bA\000-\153\b\000\000-",
    xray_type = 1,
    bytes_to_decrypt = 0
  },
  {
    sig = "\232\000\000\000\000]\139\197\129\237\142\024@\000-e\b\000\000-",
    xray_type = 1,
    bytes_to_decrypt = 0
  }
}
return pe.xray_block(l_0_0, 4, -1, -16384, -8192)
