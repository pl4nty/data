-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\264b3fd19cf4f\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = nil
local l_0_1 = nil
local l_0_2 = nil
local l_0_3 = ((bm.get_current_process_startup_info)()).command_line
if IsExcludedByCmdlineMacOS(l_0_3) or IsExcludedByImagePathMacOS((bm.get_imagepath)()) then
  return mp.CLEAN
end
if (this_sigattrlog[4]).matched and this_sigattrlog[4] ~= nil and this_sigattrlog[4] ~= "" then
  l_0_1 = (string.lower)((this_sigattrlog[4]).utf8p2)
else
  if (this_sigattrlog[5]).matched and this_sigattrlog[5] ~= nil and this_sigattrlog[5] ~= "" then
    l_0_1 = (string.lower)((this_sigattrlog[5]).utf8p2)
  else
    if (this_sigattrlog[6]).matched and this_sigattrlog[6] ~= nil and this_sigattrlog[6] ~= "" then
      l_0_1 = (string.lower)((this_sigattrlog[6]).utf8p2)
    else
      if (this_sigattrlog[7]).matched and this_sigattrlog[7] ~= nil and this_sigattrlog[7] ~= "" then
        l_0_1 = (string.lower)((this_sigattrlog[7]).utf8p2)
      else
        if (this_sigattrlog[8]).matched and this_sigattrlog[8] ~= nil and this_sigattrlog[8] ~= "" then
          l_0_1 = (string.lower)((this_sigattrlog[8]).utf8p2)
        else
          if (this_sigattrlog[9]).matched and this_sigattrlog[9] ~= nil and this_sigattrlog[9] ~= "" then
            l_0_1 = (string.lower)((this_sigattrlog[9]).utf8p2)
          end
        end
      end
    end
  end
end
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if not (string.find)(l_0_1, "/system/library/launch", 1, true) and ((string.find)(l_0_1, "/library/launchagents", 1, true) or (string.find)(l_0_1, "/library/launchdaemons", 1, true) or (string.find)(l_0_1, "/library/preferences", 1, true)) then
  TrackPidAndTechniqueBM("BM", "T1647", "DefenseEvasion_PlutilPlistFileModification")
  ;
  (mp.set_mpattribute)("BM_PlistModUsingPlutil")
  return mp.INFECTED
end
return mp.CLEAN

