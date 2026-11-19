-- Threat: !InfrastructureShared
-- Name: 38b33faad5dd
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1
if this_sigattrlog[1].matched then
  if this_sigattrlog[1].utf8p1 ~= nil then
    l_0_0 = this_sigattrlog[1].utf8p1
  end
  if this_sigattrlog[1].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[1].utf8p2
  end
end
if l_0_0 ~= nil and sysio.IsFileExists(l_0_0) then
  bm.add_related_file(l_0_0)
end
if l_0_1 ~= nil and sysio.IsFileExists(l_0_1) then
  bm.add_related_file(l_0_1)
  MpCommon.AppendPersistContext(string.lower(l_0_1), "MasqSuspRenameTarget", 3600)
  local l_0_2 = {
    "T1036.003:masquerading_target",
    "T1036.003:defenseevasion_target",
    "T1036.003:MasqSuspRename.B"
  }
  TrackFileAndTechnique(l_0_1, l_0_2)
end
return mp.INFECTED
