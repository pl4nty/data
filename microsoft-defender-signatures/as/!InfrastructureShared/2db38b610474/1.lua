-- Threat: !InfrastructureShared
-- Name: 2db38b610474
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_3)
    if sysio.IsFileExists(l_0_3) and string.sub(l_0_3, -12) ~= "regsvr32.exe" then
      local l_0_4 = sysio.GetFileLastWriteTime(l_0_3)
      if sysio.GetLastResult().Success and l_0_4 ~= 0 then
        l_0_4 = l_0_4 / 10000000 - 11644473600
        local l_0_5 = MpCommon.GetCurrentTimeT()
        if l_0_5 - l_0_4 <= 7200 then
          bm.add_related_file(l_0_3)
          return mp.INFECTED
        end
      end
    end
  end
end
return mp.CLEAN
