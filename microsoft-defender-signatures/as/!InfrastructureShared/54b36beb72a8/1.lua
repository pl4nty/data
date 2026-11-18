-- Threat: !InfrastructureShared
-- Name: 54b36beb72a8
-- Type: 21
-- Includes: BMLuaLib

if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil and this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
  local l_0_1 = mp.SIGATTR_LOG_SZ
  for l_0_2 = 1, l_0_1 do
    if sigattr_tail[l_0_2].attribute == 16470 and string.find(sigattr_tail[l_0_2].utf8p2, l_0_0, 1, true) ~= nil then
      local l_0_3 = sysio.GetFileLastWriteTime(l_0_0)
      if sysio.GetLastResult().Success and l_0_3 ~= 0 then
        l_0_3 = l_0_3 / 10000000 - 11644473600
        local l_0_4 = MpCommon.GetCurrentTimeT()
        if l_0_3 > l_0_4 or 600 < l_0_4 - l_0_3 then
          return mp.CLEAN
        end
        bm_AddRelatedFileFromCommandLine(l_0_0)
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
