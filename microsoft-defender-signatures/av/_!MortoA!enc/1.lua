-- Threat: \xb0!Morto.A!enc
-- Type: 9

if peattributes.executble_image == false then
  return mp.CLEAN
end
if peattributes.epscn_islast == false then
  return mp.CLEAN
end
if peattributes.lastscn_writable == false then
  return mp.CLEAN
end
if mp.readu_u32(epcode, 7) ~= 767591256 then
  return mp.CLEAN
end
if mp.readu_u32(epcode, 13) ~= 2165836939 then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "\199E\252\001\000\000\000\232\000\000\000\000X\137E\252\139E\252\131\192\240",
    xray_type = 3,
    bytes_to_decrypt = 0
  }
}
return pe.xray_block(l_0_0, 1, -1, pehdr.AddressOfEntryPoint - pesecs[pehdr.NumberOfSections].VirtualAddress, -1)
