-- Threat: !InfrastructureShared
-- Name: 41b35b0c4d50
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
  TrackPidAndTechniqueBM("BM", "T1218.011", "Proxy_Exec")
  local l_0_1 = extractDllForRegproc(l_0_0)
  if l_0_1 then
    l_0_1 = mp.ContextualExpandEnvironmentVariables(l_0_1)
    if sysio.IsFileExists(l_0_1) then
      local l_0_2 = sysio.GetFileLastWriteTime(l_0_1)
      if sysio.GetLastResult().Success and l_0_2 ~= 0 then
        l_0_2 = l_0_2 / 10000000 - 11644473600
        local l_0_3 = MpCommon.GetCurrentTimeT()
        if l_0_2 > l_0_3 or 3600 < l_0_3 - l_0_2 then
          bm.add_related_file(l_0_1)
          if IsDetectionThresholdMet("BM") then
            return mp.INFECTED
          end
        end
      end
    end
  end
end
return mp.CLEAN
