-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\644d7373dd40a\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if not isnull(l_0_0) then
  local l_0_1 = l_0_0.image_path
  if l_0_1 then
    local l_0_2 = (string.sub)(l_0_1, -8)
    if l_0_2 and (string.lower)(l_0_2) == "w3wp.exe" then
      local l_0_3 = l_0_0.ppid
      if isnull(l_0_3) then
        return mp.CLEAN
      end
      local l_0_4 = (mp.GetProcessCommandLine)(l_0_3)
      if isnull(l_0_4) then
        return mp.CLEAN
      end
      l_0_4 = (string.lower)(l_0_4)
      if (string.find)(l_0_4, "-ap \"msexchangeecpapppool\"", 1, true) or (string.find)(l_0_4, "-ap \"msexchangeowaapppool\"", 1, true) or (string.find)(l_0_4, "-ap \"msexchangeoabapppool\"", 1, true) or (string.find)(l_0_4, "-ap \"msexchangeowacalendarapppool\"", 1, true) or (string.find)(l_0_4, "-ap \"msexchangeservicesapppool\"", 1, true) or (string.find)(l_0_4, "-ap \"msexchangeautodiscoverapppool\"", 1, true) or (string.find)(l_0_4, "-ap \"msexchangemapifrontendapppool\"", 1, true) then
        TrackPidAndTechnique(l_0_3, "T1505.003", "webshell_parent", 604800)
        return mp.INFECTED
      end
      if (string.find)(l_0_4, "-ap \"msexchangepowershellapppool\"", 1, true) then
        local l_0_5 = (mp.GetScannedPPID)()
        local l_0_6 = (MpCommon.GetProcessElevationAndIntegrityLevel)(l_0_5)
        if l_0_6 and MpCommon.SECURITY_MANDATORY_SYSTEM_RID <= l_0_6.IntegrityLevel then
          TrackPidAndTechnique(l_0_3, "T1505.003", "webshell_parent", 604800)
          return mp.INFECTED
        end
      end
    end
  end
end
do
  return mp.CLEAN
end

