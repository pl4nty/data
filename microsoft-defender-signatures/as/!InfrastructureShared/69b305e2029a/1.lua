-- Threat: !InfrastructureShared
-- Name: 69b305e2029a
-- Type: 21

if bm.GetSignatureMatchDuration() > 100000000 then
  return mp.CLEAN
end
local l_0_0 = MpCommon.PathToWin32Path(bm.get_imagepath())
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if not string.find(l_0_0, "c:\\", 1, true) then
  return mp.CLEAN
end
if string.find(l_0_0, "\\program files", 1, true) or string.find(l_0_0, "\\windows", 1, true) or string.find(l_0_0, "\\teams.exe", 1, true) or string.find(l_0_0, "game", 1, true) or string.find(l_0_0, "steam", 1, true) or string.find(l_0_0, "\\jackettconsole", 1, true) or string.find(l_0_0, "c:\\agent.exe", 1, true) or string.find(l_0_0, "torrent", 1, true) then
  return mp.CLEAN
end
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
  return mp.INFECTED
end
return mp.CLEAN
