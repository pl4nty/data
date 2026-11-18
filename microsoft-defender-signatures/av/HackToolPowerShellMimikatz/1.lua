-- Threat: HackTool:PowerShell/Mimikatz
-- Type: 13
-- MpAttributes: MpIsPowerShellAMSIScan

local l_0_0 = 0
if mp.get_mpattribute("SCRIPT:PowerShell/Mikatz!invokefunction") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mikatz!invoke-mimikatz") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mikatz!ps1") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mikatz!command") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mikatz!cred") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mikatz!function") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mikatz!dumpcreds") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mikatz!dumpcerts") then
  l_0_0 = l_0_0 + 1
end
local l_0_1 = 0
if mp.get_mpattribute("SCRIPT:PowerShell/Mikatz!cert") then
  l_0_1 = l_0_1 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mikatz!mz") then
  l_0_1 = l_0_1 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mikatz!dllcheck") then
  l_0_1 = l_0_1 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mikatz!MachineType") then
  l_0_1 = l_0_1 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mikatz!MagicType") then
  l_0_1 = l_0_1 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mikatz!VirtualAlloc") then
  l_0_1 = l_0_1 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mikatz!memcpy") then
  l_0_1 = l_0_1 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mikatz!CreateThread") then
  l_0_1 = l_0_1 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mikatz!IsWow64Process") then
  l_0_1 = l_0_1 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mikatz!WriteShellCode") then
  l_0_1 = l_0_1 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mikatz!GetProcAddressSCx64") then
  l_0_1 = l_0_1 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mikatz!GetProcAddressSCx86") then
  l_0_1 = l_0_1 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mikatz!Invoke") then
  l_0_1 = l_0_1 + 1
end
if 1 <= l_0_0 and 5 <= l_0_1 or 13 <= l_0_1 then
  return mp.INFECTED
end
if 2 <= l_0_0 or 1 <= l_0_0 and 2 <= l_0_1 then
  mp.set_mpattribute("Lua:HackTool:PowerShell/Mimikatz!possible")
end
if 5 <= l_0_1 then
  mp.set_mpattribute("Lua:HackTool:PowerShell/Mimikatz!injector")
end
return mp.CLEAN
