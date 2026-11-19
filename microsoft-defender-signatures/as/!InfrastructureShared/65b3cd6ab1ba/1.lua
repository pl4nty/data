-- Threat: !InfrastructureShared
-- Name: 65b3cd6ab1ba
-- Type: 21
-- Includes: TechniqueTracker

for l_0_0 = 1, mp.SIGATTR_LOG_SZ do
  if sigattr_tail[l_0_0].matched and sigattr_tail[l_0_0].attribute == 16393 then
    local l_0_1 = sigattr_tail[l_0_0].utf8p1
    if l_0_1 then
      l_0_1 = string.lower(l_0_1)
      if l_0_1 and (string.find(l_0_1, "mpcmdrun.exe", 1, true) or string.find(l_0_1, "msseces.exe", 1, true) or string.find(l_0_1, "msmpeng.exe", 1, true) or string.find(l_0_1, "msascui.exe", 1, true) or string.find(l_0_1, "mpuxsrv.exe", 1, true)) then
        local l_0_2 = sigattr_tail[l_0_0].utf8p2
        if 1 <= string.len(l_0_2) then
          TrackPidAndTechniqueBM("BM", "T1562.001", "mptamper_av")
          return mp.INFECTED
        end
      end
    end
  end
end
return mp.CLEAN
