-- Threat: !InfrastructureShared
-- Name: ExcludeProc
-- Type: 15
-- Includes: ExcludeProc

local l_0_0 = "HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Exclusions\\"
local l_0_1 = sysio.RegOpenKey(l_0_0 .. "Extensions")
if l_0_1 then
  local l_0_2 = {"exe", "dll"}
  DeleteRegistryEntriesOnValueMatch(l_0_1, l_0_2)
end
local l_0_3 = sysio.RegOpenKey(l_0_0 .. "Paths")
if l_0_3 then
  local l_0_4 = {
    "%systemdrive%",
    "%userprofile%",
    "%appdata%",
    "%systemroot%",
    "%homedrive%",
    "%temp%"
  }
  l_0_4 = GetPathsFromExpandFilePath(l_0_4)
  DeleteRegistryEntriesOnValueMatch(l_0_3, l_0_4)
end
local l_0_5 = sysio.RegOpenKey(l_0_0 .. "Processes")
if l_0_5 then
  local l_0_6 = {
    "c:\\windows\\system32\\windowspowershell\\v1.0\\powershell.exe",
    "powershell.exe"
  }
  DeleteRegistryEntriesOnValueMatch(l_0_5, l_0_6)
end
