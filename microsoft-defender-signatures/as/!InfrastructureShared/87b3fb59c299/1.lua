-- Threat: !InfrastructureShared
-- Name: 87b3fb59c299
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_2 = string.find(l_0_0, "\\appdata\\local\\temp\\", 1, true) ~= nil or string.find(l_0_0, "\\temp\\", 1, true) ~= nil or string.find(l_0_0, "%temp%", 1, true) ~= nil
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = false
local l_0_4, l_0_5 = bm.get_process_relationships()
if l_0_4 == nil then
  return mp.CLEAN
end
for l_0_6, l_0_7 in ipairs(l_0_4) do
  if l_0_7.image_path ~= nil then
    local l_0_8 = string.lower(l_0_7.image_path)
    if string.find(l_0_8, "\\code.exe", 1, true) or string.find(l_0_8, "\\code - insiders.exe", 1, true) or string.find(l_0_8, "\\cursor.exe", 1, true) or string.find(l_0_8, "\\windsurf.exe", 1, true) or string.find(l_0_8, "\\trae.exe", 1, true) then
      l_0_3 = true
      break
    end
  end
end
if not l_0_3 then
  return mp.CLEAN
end
bm.add_related_string("proc_cmdline", l_0_0, bm.RelatedStringBMReport)
add_parents()
return mp.INFECTED
