-- Threat: !InfrastructureShared
-- Name: adb3bfdd6eb1
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if l_0_3.image_path ~= nil then
    local l_0_4 = mp.bitand(l_0_3.reason_ex, 1)
    if l_0_4 == 1 then
      local l_0_5, l_0_6 = bm.get_process_relationships(l_0_3.ppid)
      for l_0_7, l_0_8 in ipairs(l_0_5) do
        if l_0_8.image_path ~= nil then
          local l_0_9 = mp.bitand(l_0_8.reason_ex, 1)
          if l_0_9 == 1 then
            local l_0_10 = string.lower(l_0_8.image_path)
            if string.find(l_0_10, "excel.exe", 1, true) or string.find(l_0_10, "winword.exe", 1, true) then
              return mp.INFECTED
            end
          end
        end
      end
    end
  end
end
return mp.CLEAN
