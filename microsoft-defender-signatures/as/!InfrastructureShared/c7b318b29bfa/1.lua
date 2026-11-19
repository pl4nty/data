-- Threat: !InfrastructureShared
-- Name: c7b318b29bfa
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
end
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[2].utf8p2)
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[3].utf8p2)
end
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if string.find(l_0_1, l_0_0, 1, true) then
  addRelatedProcess()
  reportRelatedBmHits()
  local l_0_2 = l_0_0 .. "|" .. l_0_1
  bm.add_related_string("file_metadata", l_0_2, bm.RelatedStringBMReport)
  local l_0_3, l_0_4 = bm.get_process_relationships()
  for l_0_5, l_0_6 in ipairs(l_0_4) do
    bm.trigger_sig("BmTraverseTreeBlock", "Detected", l_0_6.ppid)
  end
  return mp.INFECTED
end
return mp.CLEAN
