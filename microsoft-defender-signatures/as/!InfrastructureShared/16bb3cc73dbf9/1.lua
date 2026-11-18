-- Threat: !InfrastructureShared
-- Name: 16bb3cc73dbf9
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = {
  ["5a9342bd58c799c7ad6ee5ee4cf97cae63f9e3d4"] = true,
  a738f2d8360e0243af067b2bb537c54d52bf679f = true,
  ["2b0d8125167d52a26327884a925c7f3e9ba95475"] = true
}
local l_0_1 = versioning.GetOrgID()
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = scrubData(l_0_1)
if not l_0_0[l_0_2] then
  return mp.CLEAN
end
if not this_sigattrlog[4].matched and not this_sigattrlog[5].matched and not this_sigattrlog[6].matched then
  return mp.CLEAN
end
local l_0_3
l_0_3 = this_sigattrlog[4].matched and this_sigattrlog[4] or this_sigattrlog[5].matched and this_sigattrlog[5] or this_sigattrlog[6].matched and this_sigattrlog[6] or nil
local l_0_4, l_0_5 = string.match(l_0_3.utf8p2, "^([0-9]+);regionsize:([0-9]+)")
if isnull(l_0_4) or isnull(l_0_5) then
  return mp.CLEAN
end
l_0_4 = tonumber(l_0_4)
l_0_5 = tonumber(l_0_5)
local l_0_6 = {
  "NtTraceEvent",
  "EtwEventWrite",
  "EtwEventWriteEx",
  "EtwEventWriteTransfer"
}
local l_0_7
local l_0_8 = bm.get_current_process_startup_info()
for l_0_9, l_0_10 in pairs(l_0_6) do
  l_0_7 = bm.GetProcAddress(l_0_8.ppid, "ntdll.dll", l_0_10)
  if l_0_7 ~= nil then
    local l_0_11, l_0_12 = bm.VirtualQuery(l_0_7)
    if l_0_11 and l_0_12.base_addr == l_0_4 then
      TrackPidAndTechniqueBM(l_0_8.ppid, "1562.006", "etw_patch_rt")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
