-- Threat: !InfrastructureShared
-- Name: 4ab398f7c914
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[1].utf8p1
  local l_0_1 = string.match(l_0_0, "<Command>(.*)</Command>")
  local l_0_2 = string.match(l_0_0, "<Arguments>(.*)</Arguments>")
  if l_0_1 ~= nil then
    if l_0_2 ~= nil then
      l_0_1 = l_0_1 .. " " .. l_0_2
    end
    bm_AddRelatedFileFromCommandLine(l_0_1, nil, nil, 1)
    TrackCommandLineAndTechnique(l_0_1, "T1053.005:schtask_target")
    return mp.INFECTED
  end
end
return mp.CLEAN
