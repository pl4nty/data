-- Threat: !InfrastructureShared
-- Name: 63b39fb65359
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if l_0_3.image_path ~= nil and mp.bitand(l_0_3.reason_ex, 1) == 1 and (string.find(l_0_3.image_path, "\\jumpcloud-agent.exe", 1, true) or string.find(l_0_3.image_path, "\\icinga2.exe", 1, true) or string.find(l_0_3.image_path, "\\plesksrv.exe", 1, true)) then
    return mp.CLEAN
  end
end
return mp.INFECTED
