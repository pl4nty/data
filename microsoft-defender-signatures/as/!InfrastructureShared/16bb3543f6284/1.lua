-- Threat: !InfrastructureShared
-- Name: 16bb3543f6284
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if not this_sigattrlog[4].matched and not this_sigattrlog[5].matched and not this_sigattrlog[6].matched then
  return mp.CLEAN
end
local l_0_0
l_0_0 = this_sigattrlog[4].matched and this_sigattrlog[4] or this_sigattrlog[5].matched and this_sigattrlog[5] or this_sigattrlog[6].matched and this_sigattrlog[6] or nil
local l_0_1, l_0_2 = string.match(l_0_0.utf8p2, "^([0-9]+);regionsize:([0-9]+)")
if isnull(l_0_1) or isnull(l_0_2) then
  return mp.CLEAN
end
l_0_1 = tonumber(l_0_1)
l_0_2 = tonumber(l_0_2)
local l_0_3 = {
  "NtTraceEvent",
  "EtwEventWrite",
  "EtwEventWriteEx",
  "EtwEventWriteTransfer"
}
local l_0_4
local l_0_5 = bm.get_current_process_startup_info()
for l_0_6, l_0_7 in pairs(l_0_3) do
  l_0_4 = bm.GetProcAddress(l_0_5.ppid, "ntdll.dll", l_0_7)
  if l_0_4 ~= nil then
    local l_0_8, l_0_9 = bm.VirtualQuery(l_0_4)
    if l_0_8 and l_0_9.base_addr == l_0_1 then
      TrackPidAndTechniqueBM(l_0_5.ppid, "1562.006", "etw_patch_rt")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
