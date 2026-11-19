-- Threat: !InfrastructureShared
-- Name: 467b317cd9887
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_imagepath()
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = MpCommon.PathToWin32Path(l_0_0)
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_1 = MpCommon.QueryPersistContext(l_0_0, "NewPECreatedNoCert")
if not l_0_1 then
  return mp.CLEAN
end
if mp.IsKnownFriendlyFile(l_0_0, true, false) == true then
  return mp.CLEAN
end
local l_0_2 = sysio.GetFileLastWriteTime(l_0_0)
if sysio.GetLastResult().Success and l_0_2 ~= 0 then
  l_0_2 = l_0_2 / 10000000 - 11644473600
  local l_0_3 = MpCommon.GetCurrentTimeT()
  if l_0_2 > l_0_3 or 600 < l_0_3 - l_0_2 then
    return mp.CLEAN
  end
  triggerMemoryScanOnProcessTree(true, true, "SMS_M", 100, "Behavior:Win32/DllInject.SB")
  return mp.INFECTED
end
return mp.CLEAN
