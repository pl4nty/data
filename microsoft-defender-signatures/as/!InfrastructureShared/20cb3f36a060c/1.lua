-- Threat: !InfrastructureShared
-- Name: 20cb3f36a060c
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
if l_0_0 then
  for l_0_2, l_0_3 in ipairs(l_0_0) do
    if l_0_3.ppid and l_0_3.image_path then
      local l_0_4 = string.lower(l_0_3.image_path)
      if string.find(l_0_4, "sysaid", 1, true) and mp.bitand(l_0_3.reason_ex, 1) == 1 then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
