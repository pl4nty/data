-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:LNK/SuspProcinISO.SB
-- Type: 13
-- Includes: BMLuaLib
-- MpAttributes: MpOnOpenOrCloseRtpScan & (FILE_DEVICE_IS_MOUNTED | FILE_REMOVABLE_MEDIA | FILE_READ_ONLY_DEVICE | MpFileIsOnRemovableDrive)

local l_0_0
if not mp.get_mpattribute("PACKED_WITH:[CMDEmbedded]") then
  return mp.CLEAN
end
if mp.HEADERPAGE_SZ < 256 then
  return mp.CLEAN
end
l_0_0 = tostring(headerpage)
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = {}
table.insert(l_0_1, l_0_0)
MpCommon.SetPersistContextNoPath("lnkarg_sb", l_0_1, 10)
local l_0_2 = {
  "odbcconf",
  "rundll32",
  "regsvr32",
  "powershell",
  "calc",
  "wscript",
  "cscript",
  "mshta",
  ".cmd",
  ".bat",
  "..\\.."
}
if not contains(l_0_0, l_0_2) then
  return mp.CLEAN
end
return mp.INFECTED
