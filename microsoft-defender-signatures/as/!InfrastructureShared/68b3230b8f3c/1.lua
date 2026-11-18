-- Threat: !InfrastructureShared
-- Name: 68b3230b8f3c
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if l_0_3.image_path ~= nil then
    local l_0_4 = mp.bitand(l_0_3.reason_ex, 1)
    if l_0_4 == 1 and string.find(string.lower(l_0_3.image_path), "\\spoolsv.exe", 1, true) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
