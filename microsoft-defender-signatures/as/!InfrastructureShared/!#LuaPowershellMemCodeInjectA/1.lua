local L0_1, L1_1, L2_1
L0_1 = 0
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCRIPT:PowerShell/Mikatz!dllcheck"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCRIPT:PowerShell/Mikatz!MachineType"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCRIPT:PowerShell/Mikatz!MagicType"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCRIPT:PowerShell/Mikatz!VirtualAlloc"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCRIPT:PowerShell/Mikatz!memcpy"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCRIPT:PowerShell/Mikatz!CreateThread"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCRIPT:PowerShell/Mikatz!IsWow64Process"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCRIPT:PowerShell/Mikatz!WriteShellCode"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCRIPT:PowerShell/Mikatz!GetProcAddressSCx64"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCRIPT:PowerShell/Mikatz!GetProcAddressSCx86"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCRIPT:PowerShell/Mikatz!Invoke"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
if 4 <= L0_1 then
  L1_1 = mp
  L1_1 = L1_1.set_mpattribute
  L2_1 = "Lua:Powershell/MemCodeInject.A:4"
  L1_1(L2_1)
end
if 6 <= L0_1 then
  L1_1 = mp
  L1_1 = L1_1.set_mpattribute
  L2_1 = "Lua:Powershell/MemCodeInject.A:6"
  L1_1(L2_1)
end
if 8 <= L0_1 then
  L1_1 = mp
  L1_1 = L1_1.set_mpattribute
  L2_1 = "Lua:Powershell/MemCodeInject.A:8"
  L1_1(L2_1)
end
if 10 <= L0_1 then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
