-- Threat: Trojan:SH/ShellAgent.DK
-- Type: 24
-- MpAttributes: RPF:TopLevelFile & (BM_SH_FILE | Lua:SHExt | BM_TEXT_FILE)

local l_0_0 = mp.getfilesize()
if l_0_0 == nil or 20480 <= l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.enum_mpattributesubstring("SCPT:SuspiciousShell_")
if 6 <= #l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
