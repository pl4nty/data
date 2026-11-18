-- Threat: !InfrastructureShared
-- Name: ~VirTool:Win32/Obfuscator.RC
-- Type: 8

if pehdr.NumberOfSections <= 4 then
  return mp.CLEAN
end
if mp.readu_u16(epcode, 1) ~= 5631 then
  return mp.CLEAN
end
if mp.readu_u16(epcode, 7) ~= 63617 then
  return mp.CLEAN
end
if mp.readu_u16(epcode, 9) ~= 65535 then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "\141\139\213\253\255\255\129\193\213\253\255\255Q\141\133$\244\255\255\199\000\000\000\000\000\232",
    xray_type = 11,
    bytes_to_decrypt = 0
  }
}
return pe.xray_block(l_0_0, 1, 2, 0, 256)
