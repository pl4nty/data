-- Threat: !InfrastructureShared
-- Name: dcb3222c9959
-- Type: 21

local l_0_0 = false
if not this_sigattrlog[1].matched then
  return mp.CLEAN
end
if this_sigattrlog[1].utf8p2 == nil then
  return mp.CLEAN
end
local l_0_1 = string.match(string.lower(this_sigattrlog[1].utf8p2), "-s%s+([-%w_.]+)")
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = string.format("HKLM\\SYSTEM\\CurrentControlSet\\Services\\%s\\Parameters", l_0_1)
local l_0_3 = sysio.RegOpenKey(l_0_2)
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = sysio.GetRegValueAsString(l_0_3, "ServiceDll")
if l_0_4 == nil then
  return mp.CLEAN
end
l_0_4 = mp.ContextualExpandEnvironmentVariables(l_0_4)
if l_0_4 == nil then
  return mp.CLEAN
end
if not sysio.IsFileExists(l_0_4) then
  bm.add_related_string("svc_dll", string.format("ServiceDll %s", l_0_4), bm.RelatedStringBMReport)
  l_0_0 = true
else
  if mp.IsKnownFriendlyFile(l_0_4, true, false) then
    return mp.CLEAN
  end
  local l_0_5 = sysio.GetFileLastWriteTime(l_0_4)
  local l_0_6 = sysio.GetLastResult()
  if l_0_6 ~= nil and l_0_5 ~= nil and l_0_6.Success and l_0_5 ~= 0 then
    l_0_5 = l_0_5 / 10000000 - 11644473600
    local l_0_7 = MpCommon.GetCurrentTimeT()
    if l_0_7 ~= nil and l_0_5 <= l_0_7 and l_0_7 - l_0_5 <= 600 then
      bm.add_related_file(l_0_4)
      l_0_0 = true
    end
  end
end
if not l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
