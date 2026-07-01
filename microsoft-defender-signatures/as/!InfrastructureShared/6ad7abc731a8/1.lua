-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6ad7abc731a8\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetParentProcInfo)()
if l_0_1 == nil or l_0_1.image_path == nil then
  return mp.CLEAN
end
local l_0_2 = (string.lower)(l_0_1.image_path)
if l_0_2:match("([^\\]+)$") ~= "svchost.exe" then
  return mp.CLEAN
end
local l_0_3 = (mp.GetProcessCommandLine)(l_0_1.ppid)
if not l_0_3 or #l_0_3 <= 40 then
  return mp.CLEAN
end
l_0_3 = (string.lower)(l_0_3)
local l_0_4 = contains
local l_0_5 = l_0_3
local l_0_6 = {}
-- DECOMPILER ERROR at PC54: No list found for R6 , SetList fails

-- DECOMPILER ERROR at PC58: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC61: Overwrote pending register: R7 in 'AssignReg'

if l_0_4 then
  l_0_4, l_0_6 = l_0_4(l_0_5, l_0_6), {"netsvcs"}
  if l_0_4 then
    l_0_4 = mp
    l_0_4 = l_0_4.INFECTED
    return l_0_4
  end
end
l_0_4 = mp
l_0_4 = l_0_4.CLEAN
return l_0_4

