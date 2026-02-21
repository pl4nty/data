-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\bfb3d4290e23\1.luac 

-- params : ...
-- function num : 0
if GetRollingQueue("CheckNtdsSize") ~= nil then
  return mp.CLEAN
end
if not IsActiveDirectoryRole() then
  return mp.CLEAN
end
local l_0_0 = false
local l_0_1 = (sysio.RegOpenKey)("HKLM\\SYSTEM\\CurrentControlSet\\Services\\NTDS\\Parameters")
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = (sysio.GetRegValueAsString)(l_0_1, "DSA Database File")
if l_0_2 ~= nil and (string.find)(l_0_2, "ntds.dit", -8, true) and (sysio.GetFileSize)(l_0_2) > 10737418240 then
  l_0_0 = true
end
local l_0_3 = "CheckNtdsSize"
local l_0_4 = 604800
AppendToRollingQueue(l_0_3, "ntds.dit", 1, l_0_4)
if l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN

