-- Threat: !InfrastructureShared
-- Name: 5ab3df1b362b
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 and (string.find(l_0_0, "officeclicktorun.exe", 1, true) or string.find(l_0_0, "monitoringhost.exe", 1, true)) then
  return mp.CLEAN
end
local l_0_1, l_0_2
if this_sigattrlog[1].matched then
  if this_sigattrlog[1].utf8p1 ~= nil then
    l_0_1 = this_sigattrlog[1].utf8p1
  end
  if this_sigattrlog[1].utf8p2 ~= nil then
    l_0_2 = this_sigattrlog[1].utf8p2
  end
end
if l_0_1 ~= nil and sysio.IsFileExists(l_0_1) then
  bm.add_related_file(l_0_1)
end
if l_0_2 ~= nil and sysio.IsFileExists(l_0_2) then
  bm.add_related_file(l_0_2)
  MpCommon.AppendPersistContext(string.lower(l_0_2), "MasqSuspRenameTarget", 3600)
  local l_0_3 = {
    "T1036.003:masquerading_target",
    "T1036.003:defenseevasion_target",
    "T1036.003:MasqSuspRename.D"
  }
  TrackFileAndTechnique(l_0_2, l_0_3)
end
return mp.INFECTED
