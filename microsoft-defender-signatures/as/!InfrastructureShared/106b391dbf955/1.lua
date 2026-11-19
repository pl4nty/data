-- Threat: !InfrastructureShared
-- Name: 106b391dbf955
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0, l_0_1, l_0_2
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2]
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3]
else
  return mp.CLEAN
end
if isnull(l_0_0.utf8p1) or isnull(l_0_0.utf8p2) then
  return mp.CLEAN
end
local l_0_3 = bm.get_current_process_startup_info()
if isnull(l_0_3) or isnull(l_0_3.ppid) then
  return mp.CLEAN
end
local l_0_4, l_0_5, l_0_6 = string.match(l_0_0.utf8p1, "imagename:(.+);targetprocessppid:(%d+):(%d+)$")
local l_0_7, l_0_8 = string.match(l_0_0.utf8p2, "vmbaseaddress:(.+);[a-z]-regionsize:(%d+);")
if isnull(l_0_4) or isnull(l_0_5) or isnull(l_0_6) or isnull(l_0_7) or isnull(l_0_8) then
  return mp.CLEAN
end
local l_0_9 = string.format("pid:%d,ProcessStart:%d", l_0_5, l_0_6)
if mp.SIGATTR_LOG_SZ == 0 then
  return mp.CLEAN
end
for l_0_10 = mp.SIGATTR_LOG_SZ, 1, -1 do
  local l_0_11 = sigattr_tail[l_0_10]
  if (not l_0_1 or not l_0_2) and not isnull(l_0_11.attribute) and not isnull(l_0_11.utf8p1) then
    if l_0_11.attribute == 16427 and not isnull(l_0_11.np2) and l_0_11.np2 >= 2031616 then
      local l_0_12 = string.match(l_0_11.utf8p1, "^..*\\(.+)$")
      if not isnull(l_0_12) and l_0_4 == l_0_12 then
        l_0_1 = true
      end
    elseif l_0_11.attribute == 16497 and not isnull(l_0_11.utf8p2) then
      local l_0_13, l_0_14, l_0_15 = string.match(l_0_11.utf8p2, "TargetPPID:(%d+):(%d+);TargetThreadID:(%d+)$")
      if not isnull(l_0_13) and not isnull(l_0_14) and not isnull(l_0_15) and l_0_4 == l_0_11.utf8p1 and l_0_5 == l_0_13 and l_0_6 == l_0_14 then
        l_0_2 = l_0_15
      end
    end
  end
end
if not l_0_1 or not l_0_2 then
  return mp.CLEAN
end
local l_0_16 = false
local l_0_17 = bm.get_process_relationships(l_0_9)
if isnull(l_0_17) or #l_0_17 == 0 then
  l_0_16, l_0_17 = true, {}
end
for l_0_18, l_0_19 in pairs(l_0_17) do
  if l_0_19.ppid == l_0_3.ppid then
    l_0_16 = true
  end
end
if not l_0_16 then
  return mp.CLEAN
end
local l_0_20 = string.format("Injected at least %d bytes into %s (PID:%d) at %s", l_0_8, l_0_4, l_0_5, tostring(l_0_7))
bm.add_related_string("ProcessHollowSummary", l_0_20, bm.RelatedStringBMReport)
TrackPidAndTechniqueBM(l_0_3.ppid, "T1055.012", "processhollow")
TrackPidAndTechniqueBM(l_0_9, "T1055.012", "processhollow_target")
bm.trigger_sig_target_propagate("CodeInjectTargeting", string.format("Process Hollow by %s", l_0_3.ppid), l_0_9)
bm.add_related_process(l_0_9)
AddSuspiciousRegion(l_0_7, l_0_9)
return mp.INFECTED
