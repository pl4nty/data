-- Threat: !InfrastructureShared
-- Name: 27b39fa817b7
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
if l_0_0 ~= nil then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    if sysio.IsFileExists(l_0_3) then
      bm.add_related_file(l_0_3)
    end
  end
end
TrackPidAndTechniqueBM("BM", "T1047", "used_wmic_remote_proc_create")
return mp.INFECTED
