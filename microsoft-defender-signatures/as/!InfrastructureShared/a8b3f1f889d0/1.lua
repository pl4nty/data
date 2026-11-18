-- Threat: !InfrastructureShared
-- Name: a8b3f1f889d0
-- Type: 21

if not this_sigattrlog[1].matched or not this_sigattrlog[2].matched then
  return mp.CLEAN
end
if not this_sigattrlog[1].wp2 or not this_sigattrlog[2].utf8p1 then
  return mp.CLEAN
end
local l_0_0 = mp.utf16to8(this_sigattrlog[1].wp2)
local l_0_1 = this_sigattrlog[2].utf8p1
if #l_0_0 >= #l_0_1 or string.sub(l_0_1, -#l_0_0) ~= l_0_0 then
  return mp.CLEAN
end
if not sysio.IsFileExists(l_0_1) then
  return mp.CLEAN
end
if versioning.GetCloudBlockLevel() == 4 then
  mp.TriggerScanResource("taskscheduler", l_0_1)
end
if MpCommon.GetPersistContextCountNoPath("bm_ipc_taskschd") > 0 then
  local l_0_2 = MpCommon.GetPersistContextNoPath("bm_ipc_taskschd")
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    local l_0_5, l_0_6, l_0_7 = string.match(l_0_4, "([%w%p]+);([%w%p]+);([%w%p]+)")
    mp.ReportLowfi(l_0_7, tonumber(l_0_6))
  end
end
return mp.CLEAN
