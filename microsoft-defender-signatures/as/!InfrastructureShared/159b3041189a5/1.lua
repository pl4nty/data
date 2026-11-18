-- Threat: !InfrastructureShared
-- Name: 159b3041189a5
-- Type: 21

if bm.GetSignatureMatchDuration() > 100000000 then
  return mp.CLEAN
end
local l_0_0
if this_sigattrlog[5].matched then
  l_0_0 = string.lower(this_sigattrlog[5].utf8p2)
elseif this_sigattrlog[6].matched then
  l_0_0 = string.lower(this_sigattrlog[6].utf8p2)
elseif this_sigattrlog[7].matched then
  l_0_0 = string.lower(this_sigattrlog[7].utf8p2)
elseif this_sigattrlog[8].matched then
  l_0_0 = string.lower(this_sigattrlog[8].utf8p2)
elseif this_sigattrlog[9].matched then
  l_0_0 = string.lower(this_sigattrlog[9].utf8p2)
elseif this_sigattrlog[10].matched then
  l_0_0 = string.lower(this_sigattrlog[10].utf8p2)
end
if l_0_0 ~= nil and string.len(l_0_0) > 3 then
  if string.find(l_0_0, "sqlite.dll", 1, true) or string.find(l_0_0, "axhub.dll", 1, true) or string.find(l_0_0, ".ocx", 1, true) then
    return mp.CLEAN
  end
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  if l_0_1 ~= nil then
    for l_0_2, l_0_3 in ipairs(l_0_1) do
      l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_3)
      bm.add_related_file(l_0_3)
      local l_0_4 = string.lower(MpCommon.PathToWin32Path(l_0_3))
      if l_0_4 == nil then
        return mp.CLEAN
      end
      local l_0_5 = MpCommon.QueryPersistContext(l_0_4, "NewPECreatedNoCert")
      if not l_0_5 then
        return mp.CLEAN
      end
      if mp.IsKnownFriendlyFile(l_0_4, true, false) == true then
        return mp.CLEAN
      end
      local l_0_6 = sysio.GetFileLastWriteTime(l_0_4)
      if sysio.GetLastResult().Success and l_0_6 ~= 0 then
        l_0_6 = l_0_6 / 10000000 - 11644473600
        local l_0_7 = MpCommon.GetCurrentTimeT()
        if l_0_6 > l_0_7 or 600 < l_0_7 - l_0_6 then
          return mp.CLEAN
        end
        return mp.INFECTED
      end
      return mp.CLEAN
    end
  end
end
return mp.CLEAN
