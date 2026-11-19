-- Threat: !InfrastructureShared
-- Name: 1b5b3757b753e
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.ppid ~= nil then
  local l_0_1 = mp.GetParentProcInfo(l_0_0.ppid)
  if l_0_1 ~= nil and l_0_1.image_path ~= nil then
    local l_0_2 = string.lower(l_0_1.image_path)
    bm.add_related_file(l_0_2)
  end
end
bm.request_SMS(l_0_0.ppid, "H")
bm.add_action("SmsAsyncScanEvent", 100)
return mp.INFECTED
