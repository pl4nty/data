-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c8d7813cba01\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0.image_path)
local l_0_2 = {}
-- DECOMPILER ERROR at PC18: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC19: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC21: Overwrote pending register: R4 in 'AssignReg'

local l_0_3 = (("chrome.exe").GetProcessCommandLine)("firefox.exe")
local l_0_4 = {}
-- DECOMPILER ERROR at PC24: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC25: No list found for R4 , SetList fails

-- DECOMPILER ERROR at PC26: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC27: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC28: Overwrote pending register: R7 in 'AssignReg'

if not ("edge.exe")("brave.exe", "opera.exe") then
  return mp.CLEAN
end
if not contains(l_0_3, l_0_4) then
  return mp.CLEAN
end
return mp.INFECTED

