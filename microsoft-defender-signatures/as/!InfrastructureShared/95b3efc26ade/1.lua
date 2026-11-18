-- Threat: !InfrastructureShared
-- Name: 95b3efc26ade
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
local l_0_2 = false
for l_0_3, l_0_4 in ipairs(l_0_0) do
  if l_0_4.image_path ~= nil then
    l_0_2 = true
    if string.find(l_0_4.image_path, "\\MSBuild%.exe$") ~= nil or string.find(l_0_4.image_path, "\\devenv%.exe$") ~= nil or string.find(l_0_4.image_path, "\\K2Studio%.exe$") ~= nil then
      return mp.CLEAN
    end
    bm.add_related_file(l_0_4.image_path)
  end
end
if l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
