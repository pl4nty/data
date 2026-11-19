-- Threat: !InfrastructureShared
-- Name: 15b3c1be95e1
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if l_0_3.image_path ~= nil then
    local l_0_4 = string.lower(l_0_3.image_path)
    if string.find(l_0_4, "rundll32.exe", 1, true) or string.find(l_0_4, "regsvr32.exe", 1, true) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
