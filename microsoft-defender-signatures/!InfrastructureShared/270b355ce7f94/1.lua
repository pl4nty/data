-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\270b355ce7f94\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_0.ppid, true) then
  return mp.CLEAN
end
local l_0_1, l_0_2 = (bm.get_process_relationships)()
for l_0_6,l_0_7 in ipairs(l_0_2) do
  (bm.trigger_sig)("BmTraverseTreeBlock", "Detected", l_0_7.ppid)
end
return mp.INFECTED

