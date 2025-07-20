-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\b1d756cce2bb\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if not l_0_0 or not l_0_0.image_path then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0.image_path)
if checkFileLastWriteTime(l_0_1, 120) then
  return mp.CLEAN
end
return mp.INFECTED

