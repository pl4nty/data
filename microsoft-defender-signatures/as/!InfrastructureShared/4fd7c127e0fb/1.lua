-- Threat: !InfrastructureShared
-- Name: 4fd7c127e0fb
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = MpCommon.GetImagePathFromPid(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = MpCommon.PathToWin32Path(l_0_1)
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = MpCommon.GetOriginalFileName(l_0_2)
if l_0_3 == nil then
  return mp.CLEAN
end
if l_0_3 == "WerFaultSecure.exe" or l_0_3 == "VulnWerFaultSecureExe.exe" then
  local l_0_4 = mp.GetProcessCommandLine(l_0_0)
  local l_0_5 = l_0_4:match("/type%s+(%d+)")
  if l_0_5 then
    l_0_5 = tonumber(l_0_5)
    local l_0_6 = 4
    if mp.bitand(l_0_5, l_0_6) ~= 0 then
      local l_0_7 = l_0_4:match("/pid%s+(%d+)")
      if l_0_7 then
        local l_0_8 = mp.GetPPidFromPid(l_0_7)
        local l_0_9 = MpCommon.GetImagePathFromPid(l_0_8)
        if not l_0_9 then
          return mp.CLEAN
        end
        if string.find(l_0_9:lower(), "\\windows\\system32\\lsass.exe", 1, true) then
          return mp.INFECTED
        end
      end
    end
  end
end
return mp.CLEAN
