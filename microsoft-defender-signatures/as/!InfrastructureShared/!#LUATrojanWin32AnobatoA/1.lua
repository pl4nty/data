-- Threat: !InfrastructureShared
-- Name: !#LUA:Trojan:Win32/Anobato.A
-- Type: 10

if not mp.get_mpattribute("MpInternal_imphash=104e3844f7d26941e527c62603133eee") and not mp.get_mpattribute("HSTR:VirTool:Win32/Obfuscator.AQW") then
  return mp.CLEAN
end
if pesecs[pevars.epsec].SizeOfRawData > 65536 then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "\232\r\000\000\000kernel32.dl",
    xray_type = 4,
    bytes_to_decrypt = 0
  }
}
return pe.xray_block(l_0_0, 1, pevars.epsec - 1, 0, -1)
