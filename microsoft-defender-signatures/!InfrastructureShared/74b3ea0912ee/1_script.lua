-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\74b3ea0912ee\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = (string.match)(l_0_1, "/tmp/.+%.sh$")
if l_0_2 == nil then
  return mp.CLEAN
end
;
(bm.add_related_string)("process_cmdline", l_0_1, bm.RelatedStringBMReport)
;
(bm.add_related_string)("filemetadata", l_0_2, bm.RelatedStringBMReport)
;
(bm.add_related_file)(l_0_2)
local l_0_3, l_0_4 = (bm.get_process_relationships)()
for l_0_8,l_0_9 in ipairs(l_0_4) do
  (bm.trigger_sig)("BmTraverseTreeBlock", "Detected", l_0_9.ppid)
end
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED

