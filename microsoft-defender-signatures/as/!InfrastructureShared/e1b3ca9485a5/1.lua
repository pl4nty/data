-- Threat: !InfrastructureShared
-- Name: e1b3ca9485a5
-- Type: 21

local l_0_0
if this_sigattrlog[10].matched and this_sigattrlog[10].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[10].utf8p1)
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1
if this_sigattrlog[11].matched and this_sigattrlog[11].utf8p1 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[11].utf8p1)
end
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = {
  "windir%\\winsxs\\",
  ":windows\\winsxs\\",
  "windir%\\servicing\\",
  ":windows\\servicing\\"
}
for l_0_3, l_0_4 in ipairs(l_0_2) do
  if string.sub(l_0_0, 2, #l_0_4) == l_0_4 or string.sub(l_0_1, 2, #l_0_4) == l_0_4 then
    return mp.CLEAN
  end
end
bm.add_related_file(l_0_1)
return mp.INFECTED
