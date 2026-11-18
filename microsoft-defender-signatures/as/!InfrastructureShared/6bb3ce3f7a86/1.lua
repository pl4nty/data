-- Threat: !InfrastructureShared
-- Name: 6bb3ce3f7a86
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker, LuaFuncHelper

local l_0_0 = "sensitive_cat_redirection"
local l_0_1 = bm.get_current_process_startup_info()
if l_0_1 == nil or l_0_1.ppid == nil or l_0_1.ppid == "" then
  return mp.CLEAN
end
local l_0_2 = GetTacticsTableForPid(l_0_1.ppid)
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = 0
for l_0_4, l_0_5 in pairs(l_0_2) do
  if string.find(l_0_4, "mt2023", 1, true) then
    l_0_3 = l_0_3 + 1
  end
end
if 2 < l_0_3 then
  local l_0_6 = GetRollingQueueAsHashTable(l_0_0)
  local l_0_7 = ""
  local l_0_8 = ""
  local l_0_9 = ""
  local l_0_10 = ""
  if l_0_6 == nil then
    return mp.CLEAN
  end
  if l_0_6.scr_image_path ~= nil then
    l_0_7 = l_0_6.scr_image_path
  end
  if l_0_6.scr_process_cmdline ~= nil then
    l_0_8 = l_0_6.scr_process_cmdline
  end
  if l_0_6.scr_parent_image_path ~= nil then
    l_0_9 = l_0_6.scr_parent_image_path
  end
  if l_0_6.scr_parent_process_cmdline ~= nil then
    l_0_10 = l_0_6.scr_parent_process_cmdline
  end
  bm.add_related_string("scr_image_path", l_0_7, bm.RelatedStringBMReport)
  bm.add_related_string("scr_process_cmdline", l_0_8, bm.RelatedStringBMReport)
  bm.add_related_string("scr_parent_image_path", l_0_9, bm.RelatedStringBMReport)
  bm.add_related_string("scr_parent_process_cmdline", l_0_10, bm.RelatedStringBMReport)
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN
