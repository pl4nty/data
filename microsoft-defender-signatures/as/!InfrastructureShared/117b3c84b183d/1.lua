-- Threat: !InfrastructureShared
-- Name: 117b3c84b183d
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0, l_0_1
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
local l_0_2, l_0_3, l_0_4 = string.match(l_0_0.utf8p1, "imagename:(.+);targetprocessppid:(%d+):(%d+)$")
local l_0_5, l_0_6 = string.match(l_0_0.utf8p2, "vmbaseaddress:(.+);[a-z]-regionsize:(%d+);")
if isnull(l_0_2) or isnull(l_0_3) or isnull(l_0_4) or isnull(l_0_5) or isnull(l_0_6) then
  return mp.CLEAN
end
if mp.SIGATTR_LOG_SZ == 0 then
  return mp.CLEAN
end
for l_0_7 = mp.SIGATTR_LOG_SZ, 1, -1 do
  local l_0_8 = sigattr_tail[l_0_7]
  if not l_0_1 and not isnull(l_0_8.attribute) and not isnull(l_0_8.utf8p1) and not isnull(l_0_8.np2) and l_0_8.attribute == 16427 and l_0_8.np2 >= 2031616 then
    local l_0_9 = string.match(l_0_8.utf8p1, "^..*\\(.+)$")
    if not isnull(l_0_9) and l_0_2 == l_0_9 then
      l_0_1 = true
    end
  end
end
if not l_0_1 then
  return mp.CLEAN
end
local l_0_10 = string.format("Injected at least %d bytes into %s (PID:%d) at %s", l_0_6, l_0_2, l_0_3, tostring(l_0_5))
bm.add_related_string("CodeInjectSummary", l_0_10, bm.RelatedStringBMReport)
local l_0_11 = bm.get_current_process_startup_info()
if not isnull(l_0_11) and not isnull(l_0_11.ppid) then
  TrackPidAndTechniqueBM(l_0_11.ppid, "T1055", "processinjection")
end
local l_0_12 = string.format("pid:%d,ProcessStart:%d", l_0_3, l_0_4)
TrackPidAndTechniqueBM(l_0_12, "T1055", "processinjection_target")
bm.add_related_process(l_0_12)
TriggerTargetedMemoryScan(l_0_5, l_0_12)
AddSuspiciousRegion(l_0_5, l_0_12)
return mp.INFECTED
