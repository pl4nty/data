-- Threat: !InfrastructureShared
-- Name: 74b3ea0912ee
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = string.match(l_0_1, "/tmp/.+%.sh$")
if l_0_2 == nil then
  return mp.CLEAN
end
bm.add_related_string("process_cmdline", l_0_1, bm.RelatedStringBMReport)
bm.add_related_string("filemetadata", l_0_2, bm.RelatedStringBMReport)
bm.add_related_file(l_0_2)
local l_0_3, l_0_4 = bm.get_process_relationships()
for l_0_5, l_0_6 in ipairs(l_0_4) do
  bm.trigger_sig("BmTraverseTreeBlock", "Detected", l_0_6.ppid)
end
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
