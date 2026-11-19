-- Threat: !InfrastructureShared
-- Name: ddb3c8b9a2c1
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0, l_0_1
if this_sigattrlog[2].matched then
  l_0_0, l_0_1 = string.lower(this_sigattrlog[2].utf8p1), this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched then
  l_0_0, l_0_1 = string.lower(this_sigattrlog[3].utf8p1), this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched then
  l_0_0, l_0_1 = string.lower(this_sigattrlog[4].utf8p1), this_sigattrlog[4].utf8p2
elseif this_sigattrlog[5].matched then
  l_0_0, l_0_1 = string.lower(this_sigattrlog[5].utf8p1), this_sigattrlog[5].utf8p2
end
if not (not isnull(l_0_0) and this_sigattrlog[1].matched) or not this_sigattrlog[6].matched then
  return mp.CLEAN
end
local l_0_2 = bm.get_current_process_startup_info()
if isnull(l_0_2) or isnull(l_0_2.ppid) then
  return mp.CLEAN
end
local l_0_3 = string.gsub(string.lower(this_sigattrlog[1].utf8p1), "..*\\", "")
local l_0_4 = string.lower(this_sigattrlog[6].utf8p1)
if l_0_3 ~= l_0_0 or l_0_3 ~= l_0_4 then
  return mp.CLEAN
end
local l_0_5, l_0_6 = string.match(this_sigattrlog[6].utf8p2, "TargetPPID:(%d+):(%d+);")
if isnull(l_0_5) or isnull(l_0_6) then
  return mp.CLEAN
end
local l_0_7 = string.format("pid:%d,ProcessStart:%d", l_0_5, l_0_6)
if l_0_2.ppid == l_0_7 then
  return mp.CLEAN
end
local l_0_8 = false
local l_0_9 = bm.get_process_relationships(l_0_7)
if isnull(l_0_9) or #l_0_9 == 0 then
  l_0_8, l_0_9 = true, {}
end
for l_0_10, l_0_11 in pairs(l_0_9) do
  if l_0_11.ppid == l_0_2.ppid then
    l_0_8 = true
  end
end
if not l_0_8 then
  return mp.CLEAN
end
local l_0_12 = {}
if mp.SIGATTR_LOG_SZ == 0 then
  return mp.CLEAN
end
for l_0_13 = mp.SIGATTR_LOG_SZ, 1, -1 do
  local l_0_14 = sigattr_tail[l_0_13]
  if not isnull(l_0_14.attribute) and l_0_14.attribute == 16522 and not isnull(l_0_14.utf8p1) and not isnull(l_0_14.utf8p2) and string.find(l_0_14.utf8p1, l_0_5 .. ":" .. l_0_6) and string.find(l_0_14.utf8p2, l_0_1) then
    local l_0_15, l_0_16 = string.match(l_0_14.utf8p2, "vmbaseaddress:(%d+);vm[a-z]+:(%d+)")
    if not isnull(l_0_15) and not isnull(l_0_16) and tonumber(l_0_16) > 8 then
      AddSuspiciousRegion(l_0_15, l_0_7)
      local l_0_17, l_0_18 = bm.VirtualQuery(l_0_15, l_0_7)
      if l_0_17 == true and (l_0_18.prot >= 16 and l_0_18.prot <= 128 or 16 <= l_0_18.alloc_prot and 128 >= l_0_18.alloc_prot) then
        table.insert(l_0_12, string.format("{BaseAddress=%s;Size=%s;State=%x;Prot=%x;AllocProt=%x;}", l_0_15, l_0_18.size, l_0_18.state_type, l_0_18.prot, l_0_18.alloc_prot))
      end
    end
  end
end
if isnull(l_0_12) then
  return mp.CLEAN
end
table.sort(l_0_12)
local l_0_19 = table.concat(l_0_12, ",")
local l_0_20 = string.format("{Name=%s;PPID=%s;WriteMethod=%s;SuspiciousRegions=[%s];}", l_0_0, l_0_7, l_0_1, l_0_19)
bm.add_related_string("HollowedProcessDetails", l_0_20, bm.RelatedStringBMReport)
TrackPidAndTechniqueBM(l_0_2.ppid, "T1055.012", "processhollow")
TrackPidAndTechniqueBM(l_0_7, "T1055.012", "processhollow_target")
bm.add_related_process(l_0_7)
MpCommon.SetTaintedProcess(l_0_7, bm.BM_TAINT_OTHER)
return mp.INFECTED
