-- Threat: !InfrastructureShared
-- Name: c3b39a1d38f0
-- Type: 21
-- Includes: TechniqueTracker

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
  local l_0_1 = string.lower(this_sigattrlog[1].utf8p2)
  local l_0_2 = l_0_1:match("remoteip:([^;]+)")
  if (l_0_2 ~= nil or l_0_2 ~= "" or l_0_2 ~= ";fsize") and l_0_0 ~= "" then
    TrackAttackerServer(l_0_2, 5000)
    l_0_0 = string.lower(MpCommon.PathToWin32Path(l_0_0))
    local l_0_3 = {
      "T1570:remote_dropped_FePyCompiledBin",
      "T1021.002:remote_dropped_FePyCompiledBin"
    }
    TrackFileAndTechnique(l_0_0, l_0_3)
    AddResearchData("BM", true)
    return mp.INFECTED
  end
end
return mp.CLEAN
