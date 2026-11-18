-- Threat: !InfrastructureShared
-- Name: 15b3f90b86d5
-- Type: 21

local l_0_0
local l_0_1 = bm.get_current_process_startup_info()
if l_0_1 ~= nil and l_0_1.ppid ~= nil then
  local l_0_2 = mp.GetProcessCommandLine(l_0_1.ppid)
  if l_0_2 == nil then
    return mp.CLEAN
  end
  l_0_0 = string.lower(l_0_2)
  if string.find(l_0_0, "/create", 1, true) and string.find(l_0_0, "cmd.exe", 1, true) and string.find(l_0_0, "wordpad.exe", 1, true) and string.find(l_0_0, "/sc", 1, true) and string.find(l_0_0, "/tr", 1, true) and string.find(l_0_0, "/st", 1, true) and string.find(l_0_0, "/sd", 1, true) then
    bm.request_SMS(l_0_1.ppid, "M")
    local l_0_3 = bm.get_imagepath()
    local l_0_4, l_0_5 = bm.get_process_relationships()
    for l_0_6, l_0_7 in ipairs(l_0_5) do
      if l_0_7.image_path == l_0_3 then
        bm.request_SMS(l_0_1.ppid, "M")
      end
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
