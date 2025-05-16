-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\15fb332fe65e8\0x00000458_luac 

-- params : ...
-- function num : 0
local l_0_0 = this_sigattrlog[3]
if not l_0_0.matched or (string.find)(l_0_0.utf8p2, "vavadmmfname:.+") then
  return mp.CLEAN
end
local l_0_1, l_0_2 = (string.match)(l_0_0.utf8p1, "(%d+):(%d+)")
if isnull(l_0_1) or tonumber(l_0_1) < 16 or isnull(l_0_2) or tonumber(l_0_2) >= 16 then
  return mp.CLEAN
end
local l_0_3 = (string.format)("%s:%s", l_0_2, l_0_1)
local l_0_4 = (string.match)(l_0_0.utf8p2, "^([0-9]+);regionsize")
if isnull(l_0_4) then
  return mp.CLEAN
end
l_0_4 = tonumber(l_0_4)
local l_0_5, l_0_6 = (bm.VirtualQuery)(l_0_4)
if not l_0_5 or ((l_0_6.prot ~= 4 and l_0_6.prot < 16) or l_0_6.state_type == 257 or l_0_6.state_type ~= 513) then
  return mp.CLEAN
end
local l_0_7 = (string.format)("size=%x;cur_protect=%x;alloc_protect=%x;state=%x", l_0_6.size, l_0_6.prot, l_0_6.alloc_prot, l_0_6.state_type)
local l_0_8, l_0_9 = find_nearby_protectvmlocal_changes({l_0_0.utf8p1, l_0_3}, l_0_0.utf8p2)
if l_0_8 == 0 or isnull(l_0_9) then
  return mp.CLEAN
end
l_0_8 = math_min(l_0_9[l_0_0.utf8p1], l_0_9[l_0_3])
if l_0_8 < 3 then
  return mp.CLEAN
end
local l_0_10, l_0_11 = find_nearby_suspicious_traffic(l_0_0.timestamp)
if l_0_10 == 0 or isnull(l_0_11) then
  return mp.CLEAN
end
local l_0_12 = ""
local l_0_13 = 10
for l_0_17,l_0_18 in pairs(l_0_11) do
  if l_0_8 - l_0_13 <= l_0_18.count and l_0_18.count <= l_0_8 + l_0_13 then
    local l_0_19 = ""
    for l_0_23,l_0_24 in pairs(l_0_18.uri) do
      l_0_19 = (string.format)("%s;%s", l_0_19, l_0_24)
    end
    l_0_19 = (string.gsub)(l_0_19, "^,", "")
    l_0_12 = (string.format)("%s,{Host=%s;Connections:%d;Uris:%s}", l_0_12, l_0_17, l_0_18.count, l_0_19)
  end
end
if isnull(l_0_12) then
  return mp.CLEAN
end
l_0_12 = (string.gsub)(l_0_12, "^,", "")
local l_0_25, l_0_26 = pcall(bm.ReadProcMem, l_0_4, 256, l_0_0.ppid)
if l_0_25 and not isnull(l_0_26) then
  (bm.add_related_string)("SuspectedMaskToggling_Buffer", (string.format)("Hex=%s", tohex(l_0_26)), bm.RelatedStringBMReport)
else
  ;
  (bm.add_related_string)("SuspectedMaskToggling_Buffer", "Could not read", bm.RelatedStringBMReport)
end
;
(bm.add_related_string)("SuspectedMaskToggling", (string.format)("ToggleCount=%d;Network={%s};ToggleMasks=%s;ToggleDetails={%s};VirtualQuery={%s}", l_0_8, l_0_12, l_0_0.utf8p1, l_0_0.utf8p2, l_0_7), bm.RelatedStringBMReport)
AddSuspiciousRegion(l_0_4)
TriggerTargetedMemoryScan(l_0_4, l_0_0.ppid)
;
(bm.request_SMS)(l_0_0.ppid, "H+")
return mp.INFECTED

