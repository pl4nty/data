-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaFileFromSuspAttackServerB\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.IOAVGetDownloadUrl)()
if l_0_0 ~= nil and l_0_0 ~= "" then
  l_0_0 = l_0_0:lower()
  local l_0_1 = (mp.IOAVGetProcessId)()
  if not l_0_1 then
    return mp.CLEAN
  end
  local l_0_2 = (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)
  if l_0_2 == nil or l_0_2 == "" then
    return mp.CLEAN
  end
  if l_0_2:sub(1, 8) == "\\device\\" then
    l_0_2 = ((MpCommon.PathToWin32Path)(l_0_2)):lower()
  end
  TrackPidAndTechnique(l_0_1, "T1057", "ioavurl_" .. l_0_0)
  local l_0_3 = false
  if (mp.get_mpattribute)("Lua:CloudBlockLevelGT3") then
    local l_0_4 = (mp.IOAVGetProcessPath)()
    if l_0_4 == nil or l_0_4 == "" then
      return mp.CLEAN
    end
    local l_0_5 = (mp.GetProcessCommandLine)(l_0_1)
    if l_0_5 == nil or l_0_5 == "" then
      return mp.CLEAN
    end
    l_0_3 = IsHostAttackServerCloudChk(l_0_0, "Lua:FileFromSuspAttackServer.B", l_0_4, l_0_5, "IOAV")
  else
    do
      l_0_3 = IsHostAttackServer(l_0_0)
      if l_0_3 then
        (mp.set_mpattribute)("Lua:FileFromAttackerServer")
        local l_0_6 = (string.format)("scenario:has_ioav_attackerurl;filepath:%s;attacksvr:%s", l_0_2, l_0_0)
        TT_SendBMSigTrigger(l_0_1, "file_from_attackerserver", l_0_6)
        return mp.INFECTED
      end
      do
        return mp.CLEAN
      end
    end
  end
end

