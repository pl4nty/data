-- Threat: !InfrastructureShared
-- Name: 87b37bc3a0a4
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = get_filepaths_from_string(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = "rundll32.exe"
local l_0_3 = false
for l_0_4, l_0_5 in ipairs(l_0_1) do
  if string.sub(l_0_5, -#l_0_2) ~= l_0_2 and sysio.IsFileExists(l_0_5) and checkFileLastWriteTime(l_0_5, 600) == false and mp.IsKnownFriendlyFile(l_0_5, true, false) == false then
    bm.add_related_file(l_0_5)
    l_0_3 = true
  end
end
if l_0_3 == true then
  return mp.INFECTED
end
return mp.CLEAN
