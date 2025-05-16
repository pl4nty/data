-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\cab321acfd42\0x00000a20_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_0.ppid, true) then
  return mp.CLEAN
end
local l_0_1 = nil
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
  l_0_1 = (this_sigattrlog[2]).utf8p2
else
  if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil then
    l_0_1 = (this_sigattrlog[3]).utf8p2
  end
end
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if isTainted(l_0_1, "remote_file_created_taint") then
  (bm.add_related_file)(l_0_1)
  reportRelatedBmHits()
  addRelatedProcess()
  local l_0_2, l_0_3 = (bm.get_process_relationships)()
  for l_0_7,l_0_8 in ipairs(l_0_3) do
    (bm.trigger_sig)("BmTraverseTreeBlock", "Detected", l_0_8.ppid)
  end
  return mp.INFECTED
end
do
  return mp.CLEAN
end

