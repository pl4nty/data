-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\99b34f4cdaba\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 == nil then
  return mp.CLEAN
end
if (string.find)(l_0_0.image_path, "/python", 1, true) then
  (bm.trigger_sig)("BmTraverseTreeBlockMac", "Detected", l_0_0.ppid)
  return mp.INFECTED
end
local l_0_1 = (mp.GetParentProcInfo)(l_0_0.ppid)
if l_0_1 == nil then
  return mp.CLEAN
end
if (string.find)(l_0_1.image_path, "/python", 1, true) then
  (bm.trigger_sig)("BmTraverseTreeBlockMac", "Detected", l_0_1.ppid)
  return mp.INFECTED
end
return mp.CLEAN

