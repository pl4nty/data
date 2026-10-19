-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\57d7492b7b03\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if isnull(l_0_0) or isnull(l_0_0.ppid) or isnull(l_0_0.image_path) then
  return mp.CLEAN
end
local l_0_1 = (l_0_0.image_path):match("([^\\]+)$")
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = {}
-- DECOMPILER ERROR at PC35: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC36: Overwrote pending register: R3 in 'AssignReg'

local l_0_3 = (("kmsauto").lower)(l_0_1)
if not contains(l_0_3, l_0_2) then
  return mp.CLEAN
end
return mp.INFECTED

