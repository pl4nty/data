-- Threat: !InfrastructureShared
-- Name: 2e8b3767fda93
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.ppid ~= nil then
  bm.request_SMS(l_0_0.ppid, "M")
  bm.add_action("SmsAsyncScanEvent", 500)
  bm.add_action("EmsScan", 500)
end
local l_0_1, l_0_2 = bm.get_process_relationships()
if l_0_2 ~= nil then
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    if l_0_4 ~= nil and l_0_4.ppid ~= nil then
      bm.request_SMS(l_0_4.ppid, "M")
    end
  end
end
return mp.INFECTED
