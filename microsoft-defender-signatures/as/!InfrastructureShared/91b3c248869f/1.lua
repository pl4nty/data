-- Threat: !InfrastructureShared
-- Name: 91b3c248869f
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if not this_sigattrlog[2].matched or isnull(this_sigattrlog[2].utf8p2) then
  return mp.CLEAN
end
local l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
if not string.find(l_0_0, "\\appdata\\local\\", 1, true) and not string.find(l_0_0, "%localappdata%", 1, true) then
  return mp.CLEAN
end
local l_0_1 = {
  "gatherosstate",
  "windows update",
  "windowsupdate",
  "windows defender",
  "windowsdefender",
  "microsoft update",
  "windows setup",
  "windows security",
  "windows servicing",
  "windows telemetry",
  "windows host",
  "windows shell",
  "windows module",
  "trustedinstaller"
}
local l_0_2
for l_0_3, l_0_4 in ipairs(l_0_1) do
  if string.find(l_0_0, l_0_4, 1, true) then
    l_0_2 = l_0_4
    break
  end
end
if isnull(l_0_2) then
  return mp.CLEAN
end
if is_excluded_parent_proc_auto() then
  return mp.CLEAN
end
bm.add_related_string("RUNKEY_VALUE", this_sigattrlog[2].utf8p2, bm.RelatedStringBMReport)
bm.add_related_string("MASQUERADE_TOKEN", l_0_2, bm.RelatedStringBMReport)
bm_AddRelatedFileFromCommandLine(l_0_0, nil, nil, 1)
local l_0_5 = bm.get_imagepath()
if l_0_5 then
  bm.add_related_file(l_0_5)
end
add_parents()
TrackPidAndTechniqueBM("BM", "T1547.001", "AntinoStagedPersistence.AM")
return mp.INFECTED
