-- Threat: \xb0!Expiro.gen!LM
-- Type: 10

if not peattributes.lastscn_executable then
  return mp.CLEAN
end
if not peattributes.lastscn_writable then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].SizeOfRawData < 567296 then
  return mp.CLEAN
end
if peattributes.hasappendeddata then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "\000kkqvx_64.dll\000\000\000",
    xray_type = 11,
    bytes_to_decrypt = 16
  }
}
return pe.xray_block(l_0_0, 1, -1, -4864, -1024)
