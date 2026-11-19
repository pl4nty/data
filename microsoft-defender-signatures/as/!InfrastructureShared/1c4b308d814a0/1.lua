-- Threat: !InfrastructureShared
-- Name: 1c4b308d814a0
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if not string.find(l_0_0, "/resources/app", 1, true) then
  return mp.CLEAN
end
local l_0_1 = bm.get_imagepath()
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = string.lower(l_0_1)
local l_0_3 = {
  "/node",
  "/npm",
  "/npx",
  "/yarn",
  "/pnpm",
  "/electron-builder",
  "/snap/",
  "/flatpak/",
  "/ditto",
  "/shipit",
  "/squirrel",
  "/postinstall",
  "/installer",
  "/apt",
  "/dpkg",
  "/yum",
  "/dnf",
  "/pacman",
  "/brew",
  "/pip",
  "/autoupdate",
  "/sparkle.framework/",
  "/desktopserviceshelper",
  "/.org.chromium.chromium",
  "/jamf",
  "/intunemdmagent",
  "/dropboxupdater",
  "/dropboxmacupdate",
  "/logioptionsplus",
  "/logihub",
  "/lghub",
  "/bin/cp",
  "/usr/bin/bsdtar",
  "/usr/bin/tar",
  "/adskinstallerupdatecheck",
  "/puppetlabs/"
}
if contains(l_0_2, l_0_3, true) then
  return mp.CLEAN
end
local l_0_4 = string.find(l_0_0, "/resources/app", 1, true)
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
bm.add_related_string("xp_electron_scriptjack_path", l_0_0, bm.RelatedStringBMReport)
add_parents()
TrackPidAndTechniqueBM("BM", "T1218.015", "ElectronScriptJackXP")
return mp.INFECTED
