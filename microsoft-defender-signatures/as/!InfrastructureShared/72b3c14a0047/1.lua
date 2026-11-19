-- Threat: !InfrastructureShared
-- Name: 72b3c14a0047
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
local l_0_2
for l_0_3, l_0_4 in ipairs(l_0_0) do
  l_0_2 = l_0_4.image_path
  if l_0_2 ~= nil then
    l_0_2 = string.lower(l_0_2)
    if l_0_2:find("excel.exe") or l_0_2:find("word.exe") then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
