-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2cd78a542848\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0.image_path)
local l_0_2 = (mp.GetProcessCommandLine)(l_0_0.ppid)
local l_0_3 = contains
local l_0_4 = l_0_1
local l_0_5 = {}
-- DECOMPILER ERROR at PC20: No list found for R5 , SetList fails

-- DECOMPILER ERROR at PC24: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC25: Overwrote pending register: R3 in 'AssignReg'

if not l_0_3 then
  return l_0_3
end
-- DECOMPILER ERROR at PC27: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC30: Overwrote pending register: R6 in 'AssignReg'

l_0_3, l_0_5 = l_0_3(l_0_4, l_0_5), {"node.exe"}
if not l_0_3 then
  l_0_3 = mp
  l_0_3 = l_0_3.CLEAN
  return l_0_3
end
l_0_3 = mp
l_0_3 = l_0_3.INFECTED
return l_0_3

