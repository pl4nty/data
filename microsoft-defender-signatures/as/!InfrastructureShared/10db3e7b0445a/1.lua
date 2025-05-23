-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\10db3e7b0445a\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = this_sigattrlog[3]
if not l_0_0.matched or (string.find)(l_0_0.utf8p2, "vavadmmfname:.+") then
  return mp.CLEAN
end
local l_0_1, l_0_2 = (string.match)(l_0_0.utf8p1, "(%d+):(%d+)")
if isnull(l_0_1) or tonumber(l_0_1) < 16 or tonumber(l_0_1) > 128 or isnull(l_0_2) or tonumber(l_0_2) > 1 then
  return mp.CLEAN
end
local l_0_3 = (string.match)(l_0_0.utf8p2, "^([0-9]+);regionsize")
if isnull(l_0_3) then
  return mp.CLEAN
end
l_0_3 = tonumber(l_0_3)
local l_0_4, l_0_5 = (bm.VirtualQuery)(l_0_3)
if not l_0_4 or l_0_5.state_type ~= 257 and l_0_5.state_type ~= 513 then
  return mp.CLEAN
end
local l_0_6 = (string.format)("size=%x;cur_protect=%x;alloc_protect=%x;state=%x", l_0_5.size, l_0_5.prot, l_0_5.alloc_prot, l_0_5.state_type)
local l_0_7 = find_nearby_protectvmlocal_changes
local l_0_8 = {}
-- DECOMPILER ERROR at PC91: No list found for R8 , SetList fails

-- DECOMPILER ERROR at PC92: Overwrote pending register: R9 in 'AssignReg'

l_0_7 = l_0_7(l_0_8, l_0_0.utf8p1)
if l_0_7 < 4 then
  l_0_8 = mp
  l_0_8 = l_0_8.CLEAN
  return l_0_8
end
l_0_8 = find_nearby_suspicious_traffic
l_0_8 = l_0_8(l_0_0.timestamp)
local l_0_9 = nil
if l_0_8 == 0 or isnull(l_0_9) then
  return mp.CLEAN
end
local l_0_10 = ""
local l_0_11 = 10
for l_0_15,l_0_16 in pairs(l_0_9) do
  if l_0_7 - l_0_11 <= l_0_16.count and l_0_16.count <= l_0_7 + l_0_11 then
    local l_0_17 = ""
    for l_0_21,l_0_22 in pairs(l_0_16.uri) do
      l_0_17 = (string.format)("%s;%s", l_0_17, l_0_22)
    end
    l_0_17 = (string.gsub)(l_0_17, "^,", "")
    l_0_10 = (string.format)("%s,{Host=%s;Connections:%d;Uris:%s}", l_0_10, l_0_15, l_0_16.count, l_0_17)
  end
end
if isnull(l_0_10) then
  return mp.CLEAN
end
l_0_10 = (string.gsub)(l_0_10, "^,", "")
local l_0_23, l_0_24 = pcall(bm.ReadProcMem, l_0_3, 256, l_0_0.ppid)
if l_0_23 and not isnull(l_0_24) then
  (bm.add_related_string)("SuspectedMaskToggling_Buffer", (string.format)("Hex=%s", tohex(l_0_24)), bm.RelatedStringBMReport)
else
  ;
  (bm.add_related_string)("SuspectedMaskToggling_Buffer", "Could not read", bm.RelatedStringBMReport)
end
;
(bm.add_related_string)("SuspectedMaskToggling", (string.format)("ToggleCount=%d;Network={%s};ToggleMasks=%s;ToggleDetails={%s};VirtualQuery={%s}", l_0_7, l_0_10, l_0_0.utf8p1, l_0_0.utf8p2, l_0_6), bm.RelatedStringBMReport)
AddSuspiciousRegion(l_0_3)
TriggerTargetedMemoryScan(l_0_3, l_0_0.ppid)
;
(bm.request_SMS)(l_0_0.ppid, "H+")
return mp.INFECTED

