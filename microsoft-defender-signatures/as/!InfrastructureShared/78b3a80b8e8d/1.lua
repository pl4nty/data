-- Threat: !InfrastructureShared
-- Name: 78b3a80b8e8d
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
if l_0_1 ~= nil then
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    if l_0_3.image_path ~= nil and l_0_3.ppid ~= nil then
      bm.request_SMS(l_0_3.ppid, "H")
      bm.add_action("SmsAsyncScanEvent", 5000)
    end
  end
end
if l_0_0 ~= nil then
  for l_0_4, l_0_5 in ipairs(l_0_0) do
    local l_0_6 = l_0_5.image_path
    if l_0_6 ~= nil and sysio.IsFileExists(l_0_6) then
      bm.add_threat_file(l_0_6)
    end
  end
end
return mp.INFECTED
