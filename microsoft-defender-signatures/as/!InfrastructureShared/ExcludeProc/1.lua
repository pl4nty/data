local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = "HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Exclusions\\"
L1_1 = sysio
L1_1 = L1_1.RegOpenKey
L2_1 = L0_1
L3_1 = "Extensions"
L2_1 = L2_1 .. L3_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L2_1 = {}
  L3_1 = "exe"
  L4_1 = "dll"
  L2_1[1] = L3_1
  L2_1[2] = L4_1
  L3_1 = DeleteRegistryEntriesOnValueMatch
  L4_1 = L1_1
  L5_1 = L2_1
  L3_1(L4_1, L5_1)
end
L2_1 = sysio
L2_1 = L2_1.RegOpenKey
L3_1 = L0_1
L4_1 = "Paths"
L3_1 = L3_1 .. L4_1
L2_1 = L2_1(L3_1)
if L2_1 then
  L3_1 = {}
  L4_1 = "%systemdrive%"
  L5_1 = "%userprofile%"
  L6_1 = "%appdata%"
  L7_1 = "%systemroot%"
  L8_1 = "%homedrive%"
  L9_1 = "%temp%"
  L3_1[1] = L4_1
  L3_1[2] = L5_1
  L3_1[3] = L6_1
  L3_1[4] = L7_1
  L3_1[5] = L8_1
  L3_1[6] = L9_1
  L4_1 = GetPathsFromExpandFilePath
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  L3_1 = L4_1
  L4_1 = DeleteRegistryEntriesOnValueMatch
  L5_1 = L2_1
  L6_1 = L3_1
  L4_1(L5_1, L6_1)
end
L3_1 = sysio
L3_1 = L3_1.RegOpenKey
L4_1 = L0_1
L5_1 = "Processes"
L4_1 = L4_1 .. L5_1
L3_1 = L3_1(L4_1)
if L3_1 then
  L4_1 = {}
  L5_1 = "c:\\windows\\system32\\windowspowershell\\v1.0\\powershell.exe"
  L6_1 = "powershell.exe"
  L4_1[1] = L5_1
  L4_1[2] = L6_1
  L5_1 = DeleteRegistryEntriesOnValueMatch
  L6_1 = L3_1
  L7_1 = L4_1
  L5_1(L6_1, L7_1)
end
