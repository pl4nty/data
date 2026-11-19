-- Threat: !InfrastructureShared
-- Name: 6ab3225e378c
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if l_0_3.image_path ~= nil and mp.bitand(l_0_3.reason_ex, 1) == 1 and (string.lower(string.sub(l_0_3.image_path, 13)) == "\\wmiprvse.exe" or string.lower(string.sub(l_0_3.image_path, 12)) == "\\scrcons.exe") then
    return mp.INFECTED
  end
end
return mp.CLEAN
