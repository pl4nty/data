-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3bd7808022a2\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if isnull(l_0_0) or isnull(l_0_0.ppid) or isnull(l_0_0.image_path) then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0.ppid)
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = {}
-- DECOMPILER ERROR at PC36: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC37: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC38: Overwrote pending register: R4 in 'AssignReg'

if not ("-r ")(((".js").lower)(l_0_1), l_0_2) then
  return mp.CLEAN
end
local l_0_3 = (sysio.GetPEVersionInfo)(l_0_0.image_path)
if isnull(l_0_3) or isnull(l_0_3.OriginalFilename) then
  return mp.CLEAN
end
local l_0_4 = {}
l_0_4["node.exe"] = true
if not l_0_4[(string.lower)(l_0_3.OriginalFilename)] then
  return mp.CLEAN
end
return mp.INFECTED

