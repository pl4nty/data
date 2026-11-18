-- Threat: !InfrastructureShared
-- Name: 77b37f9809d9
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if not this_sigattrlog[2].matched or this_sigattrlog[2].utf8p1 == nil then
  return mp.CLEAN
end
local l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
if string.find(l_0_0, "/node_modules/", 1, true) then
  return mp.CLEAN
end
local l_0_1 = bm.get_imagepath()
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = string.lower(l_0_1)
local l_0_3 = {
  "/dpkg",
  "/apt",
  "/yum",
  "/dnf",
  "/pacman",
  "/brew",
  "/snap",
  "/flatpak",
  "/pip",
  "/ditto",
  "/shipit",
  "/installer",
  "/postinstall",
  "/puppetlabs/",
  "/platform-python"
}
if contains(l_0_2, l_0_3, true) then
  return mp.CLEAN
end
local l_0_4 = string.find(l_0_0, "/resources/", 1, true)
if l_0_4 and 1 < l_0_4 then
  local l_0_5 = string.sub(l_0_0, 1, l_0_4 - 1)
  if string.sub(l_0_2, 1, #l_0_5) == l_0_5 then
    return mp.CLEAN
  end
end
local l_0_6 = string.find(l_0_0, ".app/", 1, true)
if l_0_6 then
  local l_0_7 = string.sub(l_0_0, 1, l_0_6 + 3)
  if string.sub(l_0_2, 1, #l_0_7) == l_0_7 then
    return mp.CLEAN
  end
end
if mp.IsKnownFriendlyFile(l_0_1, true, false) then
  return mp.CLEAN
end
bm.add_related_file(this_sigattrlog[2].utf8p1)
TrackPidAndTechniqueBM("BM", "T1218.015", "SuspElectronNodeLoadXP")
return mp.INFECTED
