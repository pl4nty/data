-- Threat: !InfrastructureShared
-- Name: 209d7fcfa7edf
-- Type: 21

local l_0_0, l_0_1, l_0_2, l_0_3
local l_0_4 = 1
while l_0_4 <= 5 do
  if l_0_4 == 1 then
    l_0_0 = mp.GetParentProcInfo()
  else
    l_0_0 = mp.GetParentProcInfo(l_0_1)
  end
  if l_0_0 == nil then
    return mp.CLEAN
  end
  l_0_1 = l_0_0.ppid
  if l_0_1 == nil then
    return mp.CLEAN
  end
  l_0_2 = l_0_0.image_path
  if l_0_2 == nil then
    return mp.CLEAN
  end
  l_0_3 = string.lower(string.match(l_0_2, "\\([^\\]+)$"))
  if l_0_3 == nil or l_0_3 == "" then
    return mp.CLEAN
  end
  if l_0_3 == "winlogon.exe" then
    return mp.CLEAN
  end
  if mp.IsKnownFriendlyFile(l_0_2, true, true) ~= true then
    break
  end
  l_0_4 = l_0_4 + 1
end
if 5 < l_0_4 and mp.IsKnownFriendlyFile(l_0_2, true, true) == true then
  return mp.CLEAN
end
if not MpCommon.QueryPersistContext(l_0_2, "RunsDestructiveCMDsParent") then
  MpCommon.AppendPersistContext(l_0_2, "RunsDestructiveCMDsParent", 0)
end
if not MpCommon.QueryPersistContext(l_0_2, "disableCachingQueryAgePrev") then
  MpCommon.AppendPersistContext(l_0_2, "disableCachingQueryAgePrev", 0)
end
mp.ReportInternalDetection(l_0_2, 1397989066, mp.TYPE_ASYNC_LOWFI)
return mp.INFECTED
