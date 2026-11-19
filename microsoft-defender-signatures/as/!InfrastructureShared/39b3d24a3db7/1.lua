-- Threat: !InfrastructureShared
-- Name: 39b3d24a3db7
-- Type: 21

if bm.GetSignatureMatchDuration() > 100000000 then
  return mp.CLEAN
end
local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if l_0_3.image_path ~= nil and string.lower(string.sub(l_0_3.image_path, -4)) == "/tmp/" then
    return mp.INFECTED
  end
end
return mp.CLEAN
