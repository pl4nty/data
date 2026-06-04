-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\19d7907735bb\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0.image_path)
if not contains(l_0_1, "node.exe") then
  return mp.CLEAN
end
local l_0_2 = (mp.GetProcessCommandLine)(l_0_0.ppid)
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = l_0_2:lower()
local l_0_3 = l_0_2:match("%f[%w]node%f[%W]%s+\"([^\"]+%.js)\"")
if not l_0_3 then
  return mp.CLEAN
end
local l_0_4 = {}
-- DECOMPILER ERROR at PC49: No list found for R4 , SetList fails

-- DECOMPILER ERROR at PC50: Overwrote pending register: R5 in 'AssignReg'

if ("npm")("cmdhstr", l_0_4) then
  return mp.INFECTED
end
return mp.CLEAN

