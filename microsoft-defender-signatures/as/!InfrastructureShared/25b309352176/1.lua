-- Threat: !InfrastructureShared
-- Name: 25b309352176
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1, l_0_2 = bm.get_process_relationships()
if l_0_2 ~= nil then
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    local l_0_5 = MpCommon.GetProcessElevationAndIntegrityLevel(l_0_4.ppid)
    if l_0_5.IntegrityLevel > l_0_0.integrity_level then
      local l_0_6 = string.lower(l_0_4.image_path)
      if string.find(l_0_6, "\\system32\\mrt.exe", -17, true) or string.find(l_0_6, "\\asep_inv.exe", -13, true) or string.find(l_0_6, "\\mpsigstub.exe", -14, true) then
        return mp.CLEAN
      end
      bm.request_SMS(l_0_4.ppid, "h+")
      bm.add_action("SmsAsyncScanEvent", 1)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
