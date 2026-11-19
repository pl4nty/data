-- Threat: !InfrastructureShared
-- Name: 8cb343bdd720
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2:lower()
end
if contains(l_0_0, {
  "RestartHealthService.js",
  "spiceworks_upload.vbs",
  "MDRCrawler",
  "checkservices.dll",
  "SetupInfObjectInstallAction",
  "InstallFonts.vbs",
  "ClearCache.vbs"
}) then
  return mp.CLEAN
end
if contains(l_0_0, "cmd.*/c", false) and contains(l_0_0, {
  " regsvr32",
  " rundll32",
  " mshta",
  " bitsadmin"
}) then
  reportSessionInformation()
  add_parents()
  return mp.INFECTED
end
return mp.CLEAN
