-- Threat: !InfrastructureShared
-- Name: 115b30cdf1824
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5]
elseif this_sigattrlog[6].matched then
  l_0_0 = this_sigattrlog[6]
elseif this_sigattrlog[7].matched then
  l_0_0 = this_sigattrlog[7]
end
if l_0_0 ~= nil then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0.utf8p2)
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    if sysio.IsFileExists(l_0_3) then
      bm.add_related_file(l_0_3)
    end
  end
end
TrackPidAndTechniqueBM("BM", "T1053.003", "Persistence")
return mp.INFECTED
