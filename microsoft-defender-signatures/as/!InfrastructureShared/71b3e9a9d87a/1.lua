-- Threat: !InfrastructureShared
-- Name: 71b3e9a9d87a
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.ppid ~= nil then
  bm.request_SMS(l_0_0.ppid, "m")
  bm.add_action("SmsAsyncScanEvent", 1)
  return mp.INFECTED
end
local l_0_1, l_0_2 = bm.get_process_relationships()
if l_0_1 ~= nil then
  for l_0_3, l_0_4 in ipairs(l_0_1) do
    if l_0_4.image_path ~= nil then
      local l_0_5 = string.lower(MpCommon.PathToWin32Path(l_0_4.image_path))
      if l_0_4.reason_ex == bm.RELATIONSHIP_CREATED and sysio.IsFileExists(l_0_5) then
        bm.add_related_file(l_0_5)
        bm.request_SMS(l_0_4.ppid, "h+")
        bm.add_action("SmsAsyncScanEvent", 1)
      end
    end
  end
end
return mp.CLEAN
