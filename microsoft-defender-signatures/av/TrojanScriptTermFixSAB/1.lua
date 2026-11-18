-- Threat: Trojan:Script/TermFix.SAB
-- Type: 13
-- MpAttributes: (MpIsWindowsTerminalAMSI | MpPowershellAmsiViaCmdLine) & (SCPT:PowerShell/iexirm | SCPT:PowerShell/iexiwr) & Implicit:FileSizeLE2000

local l_0_0 = mp.getfilesize()
mp.readprotection(false)
local l_0_1 = tostring(mp.readfile(0, l_0_0))
mp.readprotection(true)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = "iex%s*%(irm%s+['\"]?[^'\"%)%s]+['\"]?%s+%-usebasicparsing%)['\"]?%s*;?%s*e?x?i?t?%s*$"
if string.find(string.lower(l_0_1), l_0_2) then
  return mp.INFECTED
end
local l_0_3 = "iex%s*%(%(i[wr][rm]%s+['\"]?[^'\"%s%)]+['\"]?.-%-usebasicparsing.-%)%.content%)['\"]?%s*$"
if string.find(string.lower(l_0_1), l_0_3) then
  return mp.INFECTED
end
local l_0_4 = "iex%s*%(i[wr][rm]%s+['\"]?[^'\"%s%)]+['\"]?.-%-usebasicparsing.-%)['\"]?%s*$"
if string.find(string.lower(l_0_1), l_0_4) then
  return mp.INFECTED
end
return mp.CLEAN
