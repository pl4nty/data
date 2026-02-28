local L0_1, L1_1, L2_1, L3_1
L0_1 = 0
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCRIPT:PowerShell/Mikatz!invokefunction"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCRIPT:PowerShell/Mikatz!invoke-mimikatz"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCRIPT:PowerShell/Mikatz!ps1"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCRIPT:PowerShell/Mikatz!command"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCRIPT:PowerShell/Mikatz!cred"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCRIPT:PowerShell/Mikatz!function"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCRIPT:PowerShell/Mikatz!dumpcreds"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCRIPT:PowerShell/Mikatz!dumpcerts"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = 0
L2_1 = mp
L2_1 = L2_1.get_mpattribute
L3_1 = "SCRIPT:PowerShell/Mikatz!cert"
L2_1 = L2_1(L3_1)
if L2_1 then
  L1_1 = L1_1 + 1
end
L2_1 = mp
L2_1 = L2_1.get_mpattribute
L3_1 = "SCRIPT:PowerShell/Mikatz!mz"
L2_1 = L2_1(L3_1)
if L2_1 then
  L1_1 = L1_1 + 1
end
L2_1 = mp
L2_1 = L2_1.get_mpattribute
L3_1 = "SCRIPT:PowerShell/Mikatz!dllcheck"
L2_1 = L2_1(L3_1)
if L2_1 then
  L1_1 = L1_1 + 1
end
L2_1 = mp
L2_1 = L2_1.get_mpattribute
L3_1 = "SCRIPT:PowerShell/Mikatz!MachineType"
L2_1 = L2_1(L3_1)
if L2_1 then
  L1_1 = L1_1 + 1
end
L2_1 = mp
L2_1 = L2_1.get_mpattribute
L3_1 = "SCRIPT:PowerShell/Mikatz!MagicType"
L2_1 = L2_1(L3_1)
if L2_1 then
  L1_1 = L1_1 + 1
end
L2_1 = mp
L2_1 = L2_1.get_mpattribute
L3_1 = "SCRIPT:PowerShell/Mikatz!VirtualAlloc"
L2_1 = L2_1(L3_1)
if L2_1 then
  L1_1 = L1_1 + 1
end
L2_1 = mp
L2_1 = L2_1.get_mpattribute
L3_1 = "SCRIPT:PowerShell/Mikatz!memcpy"
L2_1 = L2_1(L3_1)
if L2_1 then
  L1_1 = L1_1 + 1
end
L2_1 = mp
L2_1 = L2_1.get_mpattribute
L3_1 = "SCRIPT:PowerShell/Mikatz!CreateThread"
L2_1 = L2_1(L3_1)
if L2_1 then
  L1_1 = L1_1 + 1
end
L2_1 = mp
L2_1 = L2_1.get_mpattribute
L3_1 = "SCRIPT:PowerShell/Mikatz!IsWow64Process"
L2_1 = L2_1(L3_1)
if L2_1 then
  L1_1 = L1_1 + 1
end
L2_1 = mp
L2_1 = L2_1.get_mpattribute
L3_1 = "SCRIPT:PowerShell/Mikatz!WriteShellCode"
L2_1 = L2_1(L3_1)
if L2_1 then
  L1_1 = L1_1 + 1
end
L2_1 = mp
L2_1 = L2_1.get_mpattribute
L3_1 = "SCRIPT:PowerShell/Mikatz!GetProcAddressSCx64"
L2_1 = L2_1(L3_1)
if L2_1 then
  L1_1 = L1_1 + 1
end
L2_1 = mp
L2_1 = L2_1.get_mpattribute
L3_1 = "SCRIPT:PowerShell/Mikatz!GetProcAddressSCx86"
L2_1 = L2_1(L3_1)
if L2_1 then
  L1_1 = L1_1 + 1
end
L2_1 = mp
L2_1 = L2_1.get_mpattribute
L3_1 = "SCRIPT:PowerShell/Mikatz!Invoke"
L2_1 = L2_1(L3_1)
if L2_1 then
  L1_1 = L1_1 + 1
end
if 1 <= L0_1 and 5 <= L1_1 or 13 <= L1_1 then
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
if 2 <= L0_1 or 1 <= L0_1 and 2 <= L1_1 then
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "Lua:HackTool:PowerShell/Mimikatz!possible"
  L2_1(L3_1)
end
if 5 <= L1_1 then
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "Lua:HackTool:PowerShell/Mimikatz!injector"
  L2_1(L3_1)
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
