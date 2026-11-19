-- Threat: !InfrastructureShared
-- Name: 84b3ed141c3c
-- Type: 21

if this_sigattrlog[2].matched then
  local l_0_0 = string.lower(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[2].utf8p1))
  if l_0_0 ~= nil then
    if string.find(l_0_0, "\\dism\\dismcore.dll", 1, true) or string.find(l_0_0, "\\dism50x86\\dismcore.dll", 1, true) or string.find(l_0_0, "\\tools\\amd64\\servicing\\dismcore.dll", 1, true) or string.find(l_0_0, "\\tools\\x86\\servicing\\dismcore.dll", 1, true) or string.find(l_0_0, "\\bin\\bin64\\dismcore.dll", 1, true) or string.find(l_0_0, "\\dismwin10\\x64\\dismcore.dll", 1, true) or string.find(l_0_0, "\\dismwin7\\x64\\dismcore.dll", 1, true) or string.find(l_0_0, "\\x64\\dism10\\dismcore.dll", 1, true) or string.find(l_0_0, "\\x86\\dism10\\dismcore.dll", 1, true) then
      return mp.CLEAN
    end
    local l_0_1 = sysio.GetFileLastWriteTime(l_0_0)
    if sysio.GetLastResult().Success and l_0_1 ~= 0 then
      l_0_1 = l_0_1 / 10000000 - 11644473600
      local l_0_2 = MpCommon.GetCurrentTimeT()
      if l_0_1 > l_0_2 or 600 < l_0_2 - l_0_1 then
        return mp.CLEAN
      end
    end
  end
  bm.add_related_file(l_0_0)
end
return mp.INFECTED
