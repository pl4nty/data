-- Threat: !InfrastructureShared
-- Name: 4ab350bc3c94
-- Type: 21

local l_0_0, l_0_1 = pcall(bm.get_current_process_startup_info)
if l_0_0 and l_0_1 ~= nil and l_0_1.ppid ~= nil then
  local l_0_2, l_0_3, l_0_4 = pcall(bm.get_process_relationships, l_0_1.ppid)
  if l_0_2 then
    for l_0_5, l_0_6 in ipairs(l_0_3) do
      if l_0_6.image_path ~= nil and string.find(string.lower(l_0_6.image_path), "msiexec.exe", 1, true) then
        for l_0_7, l_0_8 in ipairs(l_0_4) do
          if l_0_8 ~= nil and l_0_8.ppid ~= nil then
            bm.request_SMS(l_0_8.ppid, "m")
          end
        end
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
