-- Threat: !InfrastructureShared
-- Name: 109b3ed7a2edf
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].wp2 ~= nil then
  l_0_0 = this_sigattrlog[1]
elseif this_sigattrlog[2].matched and this_sigattrlog[2].wp2 ~= nil then
  l_0_0 = this_sigattrlog[2]
elseif this_sigattrlog[3].matched and this_sigattrlog[3].wp2 ~= nil then
  l_0_0 = this_sigattrlog[3]
elseif this_sigattrlog[4].matched and this_sigattrlog[4].wp2 ~= nil then
  l_0_0 = this_sigattrlog[4]
end
if l_0_0 ~= nil then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0.utf8p2)
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_3)
    if sysio.IsFileExists(l_0_3) then
      bm.add_related_file(l_0_3)
    end
  end
end
TrackPidAndTechniqueBM("BM", "T1003", "credapi_script")
return mp.INFECTED
