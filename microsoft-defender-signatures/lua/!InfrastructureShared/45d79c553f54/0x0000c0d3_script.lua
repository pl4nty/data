-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\45d79c553f54\0x0000c0d3_luac 

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
if l_0_2:match("([^\\]+)$") ~= "explorer.exe" then
  return mp.CLEAN
end
local l_0_3 = (mp.GetProcessCommandLine)(l_0_0)
if not l_0_3 or #l_0_3 <= 40 then
  return mp.CLEAN
end
l_0_3 = (string.lower)(l_0_3)
local l_0_4 = {}
-- DECOMPILER ERROR at PC53: No list found for R4 , SetList fails

-- DECOMPILER ERROR at PC54: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC55: Overwrote pending register: R6 in 'AssignReg'

if ("code")("mshta", l_0_4) then
  return mp.INFECTED
end
if l_0_3:match("%d%d%d%d$") then
  return mp.INFECTED
end
local l_0_5, l_0_6 = (string.gsub)(l_0_3, "*", "")
if l_0_6 >= 4 and l_0_6 <= 20 then
  return mp.INFECTED
end
return mp.CLEAN

