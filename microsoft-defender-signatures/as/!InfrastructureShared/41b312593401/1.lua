-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\41b312593401\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = (bm.get_process_relationships)()
for l_0_5,l_0_6 in ipairs(l_0_1) do
  (bm.trigger_sig)("BmTraverseTreeBlock", "Detected", l_0_6.ppid)
end
local l_0_7 = (bm.get_imagepath)()
if l_0_7 ~= "" and l_0_7 ~= nil and check_common_process_linux(l_0_7) == false then
  (bm.add_threat_file)(l_0_7)
end
return mp.INFECTED

