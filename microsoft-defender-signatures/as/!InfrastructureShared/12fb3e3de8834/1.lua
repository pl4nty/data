-- Threat: !InfrastructureShared
-- Name: 12fb3e3de8834
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if l_0_3.image_path ~= nil and mp.bitand(l_0_3.reason_ex, 1) == 1 and l_0_3.ppid ~= nil then
    local l_0_4, l_0_5 = bm.get_process_relationships(l_0_3.ppid)
    for l_0_6, l_0_7 in ipairs(l_0_4) do
      if l_0_7.image_path ~= nil then
        local l_0_8 = string.lower(l_0_7.image_path)
        if string.find(l_0_8, "runcommandextension.exe", 1, true) then
          return mp.INFECTED
        end
      end
    end
  end
end
return mp.CLEAN
