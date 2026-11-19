-- Threat: !InfrastructureShared
-- Name: 25b311eef468
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if mp.bitand(l_0_3.reason_ex, 1) == 1 and l_0_3.image_path ~= nil and string.find(string.lower(l_0_3.image_path), "\\svchost.exe", 1, true) and l_0_3.ppid ~= nil then
    bm.request_SMS(l_0_3.ppid, "M")
  end
end
bm.add_action("SmsAsyncScanEvent")
return mp.INFECTED
