-- Threat: !InfrastructureShared
-- Name: 25b365a7c81d
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
if l_0_0 ~= nil then
  for l_0_2, l_0_3 in ipairs(l_0_0) do
    if l_0_3.image_path ~= nil then
      local l_0_4 = string.lower(l_0_3.image_path)
      if string.find(l_0_4, "\\tanium client\\taniumclient.exe", -31, true) then
        return mp.CLEAN
      end
    end
  end
end
return mp.INFECTED
