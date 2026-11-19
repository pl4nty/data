-- Threat: !InfrastructureShared
-- Name: 25b39d0c4d36
-- Type: 21

local l_0_0 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
local l_0_1 = MpCommon.QueryPersistContext(l_0_0, "NewPECreatedNoCert")
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = sysio.GetFileLastWriteTime(l_0_0)
if sysio.GetLastResult().Success and l_0_2 ~= 0 then
  l_0_2 = l_0_2 / 10000000 - 11644473600
  local l_0_3 = MpCommon.GetCurrentTimeT()
  if l_0_2 > l_0_3 or 600 < l_0_3 - l_0_2 then
    return mp.CLEAN
  end
  local l_0_4 = -1
  local l_0_5 = -1
  local l_0_6 = MpCommon.GetPersistContext(l_0_0)
  if l_0_6 ~= nil then
    for l_0_7, l_0_8 in ipairs(l_0_6) do
      local l_0_9 = tonumber(string.match(l_0_8, "^Age:([0-9]+)$"))
      if l_0_9 ~= nil and l_0_4 < l_0_9 then
        l_0_4 = l_0_9
      end
      local l_0_10 = tonumber(string.match(l_0_8, "^Prevalence:([0-9]+)$"))
      if l_0_10 ~= nil and l_0_5 < l_0_10 then
        l_0_5 = l_0_10
      end
    end
  end
  if -1 < l_0_4 and l_0_4 <= 1 and -1 < l_0_5 and l_0_5 <= 100 then
    return mp.INFECTED
  end
end
return mp.CLEAN
