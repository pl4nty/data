-- Threat: !InfrastructureShared
-- Name: !#Lua:Powershell/MemCodeInject.A
-- Type: 13
-- MpAttributes: Nscript:Type_ps | BM_TEXT_FILE | PowerShell:New-Object

local l_0_0 = 0
if mp.get_mpattribute("SCRIPT:PowerShell/Mikatz!dllcheck") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mikatz!MachineType") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mikatz!MagicType") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mikatz!VirtualAlloc") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mikatz!memcpy") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mikatz!CreateThread") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mikatz!IsWow64Process") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mikatz!WriteShellCode") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mikatz!GetProcAddressSCx64") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mikatz!GetProcAddressSCx86") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mikatz!Invoke") then
  l_0_0 = l_0_0 + 1
end
if 4 <= l_0_0 then
  mp.set_mpattribute("Lua:Powershell/MemCodeInject.A:4")
end
if 6 <= l_0_0 then
  mp.set_mpattribute("Lua:Powershell/MemCodeInject.A:6")
end
if 8 <= l_0_0 then
  mp.set_mpattribute("Lua:Powershell/MemCodeInject.A:8")
end
if 10 <= l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
