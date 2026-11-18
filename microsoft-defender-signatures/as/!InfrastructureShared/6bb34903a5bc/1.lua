-- Threat: !InfrastructureShared
-- Name: 6bb34903a5bc
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
local l_0_2 = "["
for l_0_3, l_0_4 in ipairs(l_0_1) do
  if l_0_4 ~= nil and l_0_4.ppid ~= nil then
    l_0_2 = l_0_2 .. l_0_4.ppid .. ";" .. l_0_4.image_path .. "|"
  end
end
l_0_2 = l_0_2 .. "]"
if l_0_2 ~= "[]" then
  bm.add_related_string("childlist", l_0_2, bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
