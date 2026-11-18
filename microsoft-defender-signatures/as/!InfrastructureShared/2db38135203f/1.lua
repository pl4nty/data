-- Threat: !InfrastructureShared
-- Name: 2db38135203f
-- Type: 21

local l_0_0
local l_0_1, l_0_2 = bm.get_process_relationships()
for l_0_3, l_0_4 in ipairs(l_0_1) do
  if l_0_4.image_path ~= nil and mp.bitand(l_0_4.reason_ex, 1) == 1 and string.find(string.lower(l_0_4.image_path), "\\msiexec.exe", 1, true) then
    return mp.CLEAN
  end
end
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
  local l_0_5 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_6, l_0_7 in ipairs(l_0_5) do
    l_0_7 = mp.ContextualExpandEnvironmentVariables(l_0_7)
    if sysio.IsFileExists(l_0_7) and string.sub(l_0_7, -12) ~= "rundll32.exe" then
      local l_0_8 = sysio.GetFileLastWriteTime(l_0_7)
      if sysio.GetLastResult().Success and l_0_8 ~= 0 then
        l_0_8 = l_0_8 / 10000000 - 11644473600
        local l_0_9 = MpCommon.GetCurrentTimeT()
        if l_0_9 - l_0_8 <= 3600 then
          local l_0_10 = bm.get_current_process_startup_info()
          bm.request_SMS(l_0_10.ppid, "M")
          bm.add_action("SmsAsyncScanEvent", 3000)
        end
        if l_0_9 - l_0_8 <= 7200 then
          bm.add_related_file(l_0_7)
          return mp.INFECTED
        end
      end
    end
  end
end
return mp.CLEAN
