-- Threat: !InfrastructureShared
-- Name: 208b3b6b7a310
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if not this_sigattrlog[2].matched or this_sigattrlog[2].utf8p1 == nil then
  return mp.CLEAN
end
local l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
local l_0_1 = bm.get_imagepath()
if isnull(l_0_1) then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if string.find(l_0_1, "\\windows defender\\msmpeng.exe", 1, true) then
  return mp.CLEAN
end
if string.find(l_0_1, "\\explorer.exe", 1, true) then
  return mp.CLEAN
end
local l_0_2 = {
  "\\horizonclipboard.exe",
  "\\vmware-view\\",
  "\\omnissa\\",
  "\\vmware\\remote experience\\",
  "\\citrix\\",
  "\\wfica32.exe"
}
for l_0_3, l_0_4 in ipairs(l_0_2) do
  if string.find(l_0_1, l_0_4, 1, true) then
    return mp.CLEAN
  end
end
if mp.IsKnownFriendlyFile(this_sigattrlog[2].utf8p1, true, false) then
  return mp.CLEAN
end
local l_0_5 = false
local l_0_6 = {
  "\\temp\\",
  "\\tmp\\",
  "\\appdata\\",
  "\\users\\public\\",
  "\\programdata\\",
  "\\windows\\tasks\\",
  "\\perflogs\\"
}
for l_0_7, l_0_8 in ipairs(l_0_6) do
  if string.find(l_0_0, l_0_8, 1, true) then
    l_0_5 = true
    break
  end
end
if not l_0_5 then
  return mp.CLEAN
end
bm.add_related_string("rdp_reupload_file", l_0_0, bm.RelatedStringBMReport)
bm.add_related_string("rdp_reupload_proc", l_0_1, bm.RelatedStringBMReport)
add_parents()
TrackPidAndTechniqueBM("BM", "T1021.001", "SuspRdpReupload")
return mp.INFECTED
