-- Threat: !InfrastructureShared
-- Name: 32b38feb4a8c
-- Type: 21

local l_0_0, l_0_1 = pcall(bm.get_current_process_startup_info)
if l_0_0 then
  local l_0_2, l_0_3, l_0_4 = pcall(bm.get_process_relationships)
  if l_0_2 then
    for l_0_5, l_0_6 in ipairs(l_0_3) do
      if l_0_6.image_path ~= nil and (string.find(string.lower(l_0_6.image_path), "\\syswow64\\regsvr32.exe", 1, true) or string.find(string.lower(l_0_6.image_path), "\\syswow64\\rundll32.exe", 1, true)) and l_0_1 ~= nil and l_0_1.ppid ~= nil then
        bm.request_SMS(l_0_1.ppid, "m")
        bm.add_action("SmsAsyncScanEvent", 1)
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
