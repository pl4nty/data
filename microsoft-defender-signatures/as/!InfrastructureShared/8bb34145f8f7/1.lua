-- Threat: !InfrastructureShared
-- Name: 8bb34145f8f7
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if l_0_3.image_path ~= nil and mp.bitand(l_0_3.reason_ex, 1) == 1 then
    if string.lower(string.sub(l_0_3.image_path, -11)) == "svchost.exe" then
      return mp.INFECTED
    else
      return mp.CLEAN
    end
  end
end
return mp.CLEAN
