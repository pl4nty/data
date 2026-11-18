-- Threat: !InfrastructureShared
-- Name: 85b3d2756635
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if mp.bitand(l_0_3.reason_ex, 1) == 1 and l_0_3.image_path ~= nil and string.find(string.lower(l_0_3.image_path), "\\wermgr.exe", 1, true) and l_0_3.ppid ~= nil then
    bm.request_SMS(l_0_3.ppid, "M")
    bm.add_action("SmsAsyncScanEvent", 1000)
  end
end
return mp.INFECTED
