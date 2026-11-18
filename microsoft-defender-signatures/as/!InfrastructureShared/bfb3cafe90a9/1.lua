-- Threat: !InfrastructureShared
-- Name: bfb3cafe90a9
-- Type: 21

local l_0_0, l_0_1, l_0_2, l_0_3
if this_sigattrlog[4].matched then
  l_0_3 = this_sigattrlog[4].utf8p2
  if l_0_3 ~= nil then
    l_0_0 = l_0_3
  end
end
if this_sigattrlog[5].matched then
  l_0_3 = this_sigattrlog[5].utf8p2
  if l_0_3 ~= nil then
    l_0_1 = l_0_3
  end
end
if this_sigattrlog[6].matched then
  l_0_3 = this_sigattrlog[6].utf8p1
  if l_0_3 ~= nil then
    l_0_2 = l_0_3
  end
end
local l_0_4, l_0_5 = bm.get_process_relationships()
for l_0_6, l_0_7 in ipairs(l_0_4) do
  if l_0_7.image_path ~= nil and string.find(l_0_7.image_path, "XCBBuildService.bundle/Contents/MacOS/XCBBuildService", -53, true) then
    local l_0_8 = l_0_1:match("+x [\"]*([^\"]+)")
    if string.find(l_0_2, l_0_8, 1, true) and string.find(l_0_0, l_0_8, 1, true) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
