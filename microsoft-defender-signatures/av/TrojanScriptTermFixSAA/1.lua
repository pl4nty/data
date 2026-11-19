-- Threat: Trojan:Script/TermFix.SAA
-- Type: 13
-- MpAttributes: MpIsWindowsTerminalAMSI & SCPT:PowerShell/iexirm & Implicit:FileSizeLE2000

local function l_0_0(l_1_0)
  return string.find(l_1_0, "^%s*<#[^#]*#>") or string.find(l_1_0, "<#[^#]*#>%s*$")
end

local l_0_1 = mp.getfilesize()
mp.readprotection(false)
local l_0_2 = tostring(mp.readfile(0, l_0_1))
mp.readprotection(true)
if l_0_2 == nil then
  return mp.CLEAN
end
if l_0_0(l_0_2) then
  return mp.INFECTED
end
return mp.CLEAN
