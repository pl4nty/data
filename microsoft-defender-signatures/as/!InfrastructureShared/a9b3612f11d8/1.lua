-- Threat: !InfrastructureShared
-- Name: a9b3612f11d8
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 and (string.find(l_0_0, "tiworker.exe", 1, true) or string.find(l_0_0, "dismhost.exe", 1, true) or string.find(l_0_0, "zscaler-windows", 1, true)) then
  return mp.CLEAN
end
local l_0_1
if this_sigattrlog[4].matched then
  if this_sigattrlog[4].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[4].utf8p2
  end
elseif this_sigattrlog[5].matched then
  if this_sigattrlog[5].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[5].utf8p2
  end
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[6].utf8p2
end
if l_0_1 ~= nil and sysio.IsFileExists(l_0_1) then
  bm.add_related_file(l_0_1)
  MpCommon.AppendPersistContext(string.lower(l_0_1), "MasqSuspRenameTargetL2", 3600)
  local l_0_2 = {
    "T1036.003:masquerading_target",
    "T1036.003:defenseevasion_target",
    "T1036.003:MasqSuspRename.H"
  }
  TrackFileAndTechnique(l_0_1, l_0_2)
end
return mp.INFECTED
