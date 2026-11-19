-- Threat: !InfrastructureShared
-- Name: 15b362aecaba
-- Type: 21

local l_0_0
local l_0_1 = bm.get_current_process_startup_info()
if l_0_1 ~= nil and l_0_1.ppid ~= nil then
  l_0_0 = string.lower(mp.GetProcessCommandLine(l_0_1.ppid))
  if string.find(l_0_0, "/create", 1, true) and string.find(l_0_0, "cmd.exe", 1, true) and string.find(l_0_0, "wordpad.exe", 1, true) and string.find(l_0_0, "/sc", 1, true) and string.find(l_0_0, "/tr", 1, true) and string.find(l_0_0, "/st", 1, true) and string.find(l_0_0, "/sd", 1, true) then
    bm.request_SMS(l_0_1.ppid, "M")
    bm.add_action("SmsAsyncScanEvent", 1)
    local l_0_2 = bm.get_process_relationships()
    for l_0_3, l_0_4 in ipairs(l_0_2) do
      if l_0_4.ppid ~= nil then
        bm.request_SMS(l_0_4.ppid, "M")
      end
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
