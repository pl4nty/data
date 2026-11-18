-- Threat: \xb0KK32.1012
-- Type: 8

if pehdr.Win32VersionValue ~= 47806 then
  return mp.CLEAN
end
if mp.getfilesize() <= 1012 then
  return mp.CLEAN
end
if pehdr.NumberOfSections == 0 then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "\128|$\003\191\015\1333\001\000\000`\232\000\000\000\000]\129\237/\016@\000",
    xray_type = 0,
    bytes_to_decrypt = 0
  }
}
return pe.xray_block(l_0_0, 1, -3, -1012, -512)
