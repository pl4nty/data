-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\67bb3436c7882\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = IsDeviceHVAWithAD()
if l_0_0 == true then
  local l_0_1 = false
  local l_0_2 = {}
  local l_0_3 = (mp.GetScannedPPID)()
  if not l_0_3 then
    return mp.CLEAN
  end
  if IsProcNameInParentProcessTree("BM", "wsmprovhost.exe") then
    l_0_1 = true
    l_0_2.Parent = "wsmprovhost.exe"
  else
    local l_0_4 = pcall(MpCommon.QuerySessionInformation, l_0_3, MpCommon.WTSIsRemoteSession)
    if MpCommon.QuerySessionInformation then
      l_0_1 = true
      l_0_2.Parent = "RemoteSession"
    end
  end
  do
    do
      if l_0_1 then
        local l_0_5 = getSessionInfo(l_0_3, "WsmMonitorForChange")
        l_0_2 = l_0_5
        l_0_5 = set_research_data
        l_0_5("HVASessionInfo", safeJsonSerialize(l_0_2), false)
        l_0_5 = mp
        l_0_5 = l_0_5.INFECTED
        return l_0_5
      end
      return mp.CLEAN
    end
  end
end

