-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/CrispyConf.gen!dha
-- Type: 13
-- MpAttributes: LUA:FileSizeLE1000.A & BM_UNKNOWN_FILE

if mp.HEADERPAGE_SZ < 256 then
  return mp.CLEAN
end
local l_0_0 = mp.readheader(0, 12)
if l_0_0 == "\152\017\026E\144x\186\249N\214\143\238" then
  mp.set_mpattribute("MpNonPIIFileType")
  return mp.INFECTED
end
return mp.CLEAN
