-- Threat: !InfrastructureShared
-- Name: 1e9b34be18e2c
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if not this_sigattrlog[2].matched then
  return mp.CLEAN
end
if not this_sigattrlog[6].matched or this_sigattrlog[6].utf8p1 == nil then
  return mp.CLEAN
end
local l_0_0 = bm.get_imagepath()
if isnull(l_0_0) then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if string.find(l_0_0, "\\windows defender\\msmpeng.exe", 1, true) then
  return mp.CLEAN
end
if mp.IsKnownFriendlyFile(l_0_0, true, false) then
  return mp.CLEAN
end
local l_0_1 = {
  "googleupdate",
  "entrasync",
  "onedrive",
  "microsoftupdate",
  "windowsupdate",
  "chromeupdate",
  "adobeupdate",
  "firefoxupdate",
  "code-tunnel"
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
local l_0_5 = string.lower(this_sigattrlog[6].utf8p1)
bm.add_related_string("masq_proc", l_0_0, bm.RelatedStringBMReport)
bm.add_related_string("masq_drop", l_0_5, bm.RelatedStringBMReport)
add_parents()
TrackPidAndTechniqueBM("BM", "T1036.005", "SuspMasqPayloadDeploy")
return mp.INFECTED
