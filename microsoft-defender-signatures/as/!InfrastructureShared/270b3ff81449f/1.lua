-- Threat: !InfrastructureShared
-- Name: 270b3ff81449f
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[8].matched and this_sigattrlog[8].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[8].utf8p2
elseif this_sigattrlog[9].matched and this_sigattrlog[9].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[9].utf8p2
elseif this_sigattrlog[10].matched and this_sigattrlog[10].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[10].utf8p2
elseif this_sigattrlog[11].matched and this_sigattrlog[11].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[11].utf8p2
elseif this_sigattrlog[12].matched and this_sigattrlog[12].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[12].utf8p2
elseif this_sigattrlog[13].matched and this_sigattrlog[13].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[13].utf8p2
elseif this_sigattrlog[14].matched and this_sigattrlog[14].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[14].utf8p2
elseif this_sigattrlog[15].matched and this_sigattrlog[15].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[15].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_1 = {
  "\\appdata\\",
  "\\start menu\\programs\\startup\\",
  "\\local\\temp\\",
  "\\programdata\\",
  "\\public\\",
  "\\microsoft\\templates\\",
  "\\word\\startup\\",
  "\\excel\\xlstart\\"
}
local l_0_2 = false
for l_0_3, l_0_4 in ipairs(l_0_1) do
  if string.find(l_0_0, l_0_4, 1, true) then
    l_0_2 = true
    break
  end
end
if not l_0_2 then
  return mp.CLEAN
end
local l_0_5 = bm.get_imagepath()
if not isnull(l_0_5) then
  local l_0_6 = string.lower(l_0_5)
  if string.find(l_0_6, "\\windows defender\\msmpeng.exe", 1, true) then
    return mp.CLEAN
  end
end
bm.add_related_string("ChildCmdline", l_0_0, bm.RelatedStringBMReport)
add_parents()
TrackPidAndTechniqueBM("BM", "T1203", "cve_2025_8088_archive_exec_chain")
TrackPidAndTechniqueBM("BM", "T1059", "archive_post_extract_exec")
return mp.INFECTED
