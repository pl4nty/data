-- Threat: !InfrastructureShared
-- Name: cab321acfd42
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_0.ppid, true) then
  return mp.CLEAN
end
local l_0_1
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[3].utf8p2
end
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if isTainted(l_0_1, "remote_file_created_taint") then
  bm.add_related_file(l_0_1)
  reportRelatedBmHits()
  addRelatedProcess()
  local l_0_2, l_0_3 = bm.get_process_relationships()
  for l_0_4, l_0_5 in ipairs(l_0_3) do
    bm.trigger_sig("BmTraverseTreeBlock", "Detected", l_0_5.ppid)
  end
  return mp.INFECTED
end
return mp.CLEAN
