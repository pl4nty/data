-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:SH/TamperSecuritySoftware.DK
-- Type: 24
-- MpAttributes: RPF:TopLevelFile & (BM_SH_FILE | Lua:SHExt | BM_TEXT_FILE)

local l_0_0 = mp.getfilesize()
if l_0_0 == nil or 20480 <= l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.enum_mpattributesubstring("SCPT:SuspiciousShell_mdatp_")
if l_0_1 == nil or #l_0_1 == 0 then
  return mp.CLEAN
end
local l_0_2 = mp.enum_mpattributesubstring("SCPT:SuspiciousShell_carbonblack_removal_")
if l_0_2 == nil or #l_0_2 == 0 then
  return mp.CLEAN
end
local l_0_3 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if l_0_3 == nil or l_0_3 == "" or l_0_3 == "/root/.bash_history" then
  return mp.CLEAN
end
return mp.INFECTED
