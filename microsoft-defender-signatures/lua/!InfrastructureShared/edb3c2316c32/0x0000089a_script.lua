-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\edb3c2316c32\0x0000089a_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = l_0_0.command_line
local l_0_2 = (bm.get_imagepath)()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = nil
if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p2 ~= nil and (this_sigattrlog[5]).utf8p2 ~= "" then
  l_0_3 = (mp.GetExecutablesFromCommandLine)((this_sigattrlog[5]).utf8p2)
end
if l_0_3 ~= nil then
  for l_0_7,l_0_8 in ipairs(l_0_3) do
    if (sysio.IsFileExists)(l_0_8) and SuspMacPathsToMonitor(l_0_8, true) then
      TrackPidAndTechniqueBM("BM", "T1539", "CredentialAccess_BrowserCookies_Edge1")
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

