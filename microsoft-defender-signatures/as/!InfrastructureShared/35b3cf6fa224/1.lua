-- Threat: !InfrastructureShared
-- Name: 35b3cf6fa224
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
local l_0_2
for l_0_3, l_0_4 in ipairs(l_0_1) do
  if l_0_4.image_path ~= nil then
    local l_0_5 = mp.bitand(l_0_4.reason_ex, 1)
    if l_0_5 == 1 then
      l_0_2 = string.lower(l_0_4.image_path)
      if string.find(l_0_2, "\\powershell.exe", 1, true) then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
