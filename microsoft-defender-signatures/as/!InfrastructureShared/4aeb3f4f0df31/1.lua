-- Threat: !InfrastructureShared
-- Name: 4aeb3f4f0df31
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2]
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3]
elseif this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4]
elseif this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5]
elseif this_sigattrlog[6].matched then
  l_0_0 = this_sigattrlog[6]
elseif this_sigattrlog[7].matched then
  l_0_0 = this_sigattrlog[7]
elseif this_sigattrlog[8].matched then
  l_0_0 = this_sigattrlog[8]
end
if isnull(l_0_0) or isnull(l_0_0.utf8p1) or isnull(l_0_0.utf8p2) or isnull(l_0_0.ppid) or isnull(l_0_0.timestamp) then
  return mp.CLEAN
end
local l_0_1, l_0_2 = string.match(l_0_0.utf8p1, "(%d+):(%d+)")
if isnull(l_0_1) or tonumber(l_0_1) < 16 or tonumber(l_0_1) > 128 or isnull(l_0_2) or tonumber(l_0_2) < 258 then
  return mp.CLEAN
end
local l_0_3 = string.match(l_0_0.utf8p2, "^([0-9]+);regionsize")
if isnull(l_0_3) then
  return mp.CLEAN
end
l_0_3 = tonumber(l_0_3)
local l_0_4, l_0_5 = bm.VirtualQuery(l_0_3)
if not l_0_4 or l_0_5.state_type ~= 257 and l_0_5.state_type ~= 513 and l_0_5.state_type ~= 1025 then
  return mp.CLEAN
end
local l_0_6 = string.format("size=%x;cur_protect=%x;alloc_protect=%x;state=%x", l_0_5.size, l_0_5.prot, l_0_5.alloc_prot, l_0_5.state_type)
local l_0_7 = find_nearby_protectvmlocal_changes({
  l_0_0.utf8p1
}, l_0_0.utf8p2)
if l_0_7 < 4 then
  return mp.CLEAN
end
local l_0_8, l_0_9 = find_nearby_suspicious_traffic(l_0_0.timestamp)
if l_0_8 == 0 or isnull(l_0_9) then
  return mp.CLEAN
end
local l_0_10 = ""
local l_0_11 = 10
for l_0_12, l_0_13 in pairs(l_0_9) do
  if l_0_13.count >= l_0_7 - l_0_11 and l_0_13.count <= l_0_7 + l_0_11 then
    local l_0_14 = ""
    for l_0_15, l_0_16 in pairs(l_0_13.uri) do
      l_0_14 = string.format("%s;%s", l_0_14, l_0_16)
    end
    l_0_14 = string.gsub(l_0_14, "^,", "")
    l_0_10 = string.format("%s,{Host=%s;Connections:%d;Uris:%s}", l_0_10, l_0_12, l_0_13.count, l_0_14)
  end
end
if isnull(l_0_10) then
  return mp.CLEAN
end
l_0_10 = string.gsub(l_0_10, "^,", "")
local l_0_17, l_0_18 = pcall(bm.ReadProcMem, l_0_3, 256, l_0_0.ppid)
if l_0_17 and not isnull(l_0_18) then
  bm.add_related_string("SuspectedMaskToggling_Buffer", string.format("Hex=%s", tohex(l_0_18)), bm.RelatedStringBMReport)
else
  bm.add_related_string("SuspectedMaskToggling_Buffer", "Could not read", bm.RelatedStringBMReport)
end
bm.add_related_string("SuspectedMaskToggling", string.format("ToggleCount=%d;Network={%s};ToggleMasks=%s;ToggleDetails={%s};VirtualQuery={%s}", l_0_7, l_0_10, l_0_0.utf8p1, l_0_0.utf8p2, l_0_6), bm.RelatedStringBMReport)
AddSuspiciousRegion(l_0_3)
TriggerTargetedMemoryScan(l_0_3, l_0_0.ppid)
bm.request_SMS(l_0_0.ppid, "H+")
return mp.INFECTED
