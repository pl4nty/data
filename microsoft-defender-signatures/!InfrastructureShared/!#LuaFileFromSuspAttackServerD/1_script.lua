-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaFileFromSuspAttackServerD\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
if (string.sub)(l_0_2, 1, 12) == "\\device\\mup\\" then
  if l_0_2:find("\\sysvol\\", 1, true) or l_0_2:find("\\netlogon\\", 1, true) then
    return mp.CLEAN
  end
  l_0_2 = ((MpCommon.PathToWin32Path)(l_0_2)):lower()
  TrackPidAndTechnique(l_0_0, "T1057", "remoteshare_" .. l_0_2)
  local l_0_3 = false
  if (mp.get_mpattribute)("Lua:CloudBlockLevelGT3") then
    local l_0_4 = (mp.GetProcessCommandLine)(l_0_0)
    if l_0_4 == nil or l_0_4 == "" then
      return mp.CLEAN
    end
    l_0_3 = IsHostAttackServerCloudChk(l_0_2, "Lua:FileFromSuspAttackServer.D", l_0_1, l_0_4, "SMBShare")
  else
    do
      l_0_3 = IsHostAttackServer(l_0_2)
      if l_0_3 then
        (mp.set_mpattribute)("Lua:FileFromAttackerServer")
        local l_0_5 = (string.format)("scenario:open_from_attackershare;filepath:%s;attacksvr:%s", l_0_2, l_0_2)
        TT_SendBMSigTrigger(l_0_0, "file_from_attackerserver", l_0_5)
        return mp.INFECTED
      end
      do
        return mp.CLEAN
      end
    end
  end
end

