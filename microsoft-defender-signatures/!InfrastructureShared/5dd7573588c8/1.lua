-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5dd7573588c8\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 == nil or l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0.image_path)
local l_0_2 = l_0_1:match("([^\\]+)$")
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = contains
local l_0_4 = l_0_2
local l_0_5 = {}
-- DECOMPILER ERROR at PC27: No list found for R5 , SetList fails

-- DECOMPILER ERROR at PC31: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC32: Overwrote pending register: R3 in 'AssignReg'

if not l_0_3 then
  return l_0_3
end
-- DECOMPILER ERROR at PC34: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC35: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC42: Overwrote pending register: R4 in 'AssignReg'

if l_0_3 == "" or l_0_3 == nil then
  return l_0_4
end
-- DECOMPILER ERROR at PC44: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC45: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC50: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC51: Overwrote pending register: R5 in 'AssignReg'

if not l_0_4 then
  return l_0_5
end
-- DECOMPILER ERROR at PC53: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC54: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC55: Overwrote pending register: R6 in 'AssignReg'

l_0_5 = l_0_5("explorer.exe")
-- DECOMPILER ERROR at PC57: Overwrote pending register: R4 in 'AssignReg'

l_0_5 = #l_0_4
if l_0_5 < 50 then
  l_0_5 = mp
  l_0_5 = l_0_5.CLEAN
  return l_0_5
end
if contains(l_0_4, l_0_5) then
  return mp.INFECTED
end
return mp.CLEAN

