-- Threat: !InfrastructureShared
-- Name: 35b37d962e80
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.sub(l_0_0, -17) == "\\inetsrv\\w3wp.exe" then
  return mp.INFECTED
end
local l_0_1, l_0_2 = bm.get_process_relationships()
for l_0_3, l_0_4 in ipairs(l_0_1) do
  if l_0_4.image_path ~= nil and mp.bitand(l_0_4.reason_ex, 1) == 1 and string.lower(string.sub(l_0_4.image_path, -17)) == "\\inetsrv\\w3wp.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
