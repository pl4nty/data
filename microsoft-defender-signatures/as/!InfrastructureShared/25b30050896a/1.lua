-- Threat: !InfrastructureShared
-- Name: 25b30050896a
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  local l_0_4 = l_0_3.image_path
  if l_0_4 ~= nil then
    local l_0_5 = l_0_4:lower()
    if l_0_5:find("setup", 1, true) then
      return mp.CLEAN
    end
    if l_0_5:find("installer", 1, true) then
      return mp.CLEAN
    end
  end
end
return mp.INFECTED
