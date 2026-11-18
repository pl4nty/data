-- Threat: !InfrastructureShared
-- Name: edb3c2316c32
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
local l_0_2 = bm.get_imagepath()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_3
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil and this_sigattrlog[5].utf8p2 ~= "" then
  l_0_3 = mp.GetExecutablesFromCommandLine(this_sigattrlog[5].utf8p2)
end
if l_0_3 ~= nil then
  for l_0_4, l_0_5 in ipairs(l_0_3) do
    if sysio.IsFileExists(l_0_5) and SuspMacPathsToMonitor(l_0_5, true) then
      TrackPidAndTechniqueBM("BM", "T1539", "CredentialAccess_BrowserCookies_Edge1")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
