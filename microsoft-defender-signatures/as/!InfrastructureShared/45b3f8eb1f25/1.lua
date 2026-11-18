-- Threat: !InfrastructureShared
-- Name: 45b3f8eb1f25
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if l_0_3.image_path ~= nil then
    local l_0_4 = string.lower(l_0_3.image_path)
    if string.find(l_0_4, "excel.exe", 1, true) or string.find(l_0_4, "winword.exe", 1, true) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
