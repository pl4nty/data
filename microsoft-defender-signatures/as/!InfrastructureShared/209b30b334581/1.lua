-- Threat: !InfrastructureShared
-- Name: 209b30b334581
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 and (string.find(l_0_0, "tiworker.exe", 1, true) or string.find(l_0_0, "dismhost.exe", 1, true) or string.find(l_0_0, "zscaler-windows", 1, true)) then
  return mp.CLEAN
end
local l_0_1
if this_sigattrlog[10].matched then
  if this_sigattrlog[10].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[10].utf8p2
  end
elseif this_sigattrlog[11].matched then
  if this_sigattrlog[11].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[11].utf8p2
  end
elseif this_sigattrlog[12].matched then
  if this_sigattrlog[12].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[12].utf8p2
  end
elseif this_sigattrlog[13].matched then
  if this_sigattrlog[13].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[13].utf8p2
  end
elseif this_sigattrlog[14].matched then
  if this_sigattrlog[14].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[14].utf8p2
  end
elseif this_sigattrlog[15].matched then
  if this_sigattrlog[15].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[15].utf8p2
  end
elseif this_sigattrlog[16].matched then
  if this_sigattrlog[16].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[16].utf8p2
  end
elseif this_sigattrlog[17].matched then
  if this_sigattrlog[17].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[17].utf8p2
  end
elseif this_sigattrlog[18].matched and this_sigattrlog[18].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[18].utf8p2
end
if l_0_1 ~= nil and sysio.IsFileExists(l_0_1) then
  bm.add_related_file(l_0_1)
  MpCommon.AppendPersistContext(string.lower(l_0_1), "MasqSuspRenameTargetL2", 3600)
  local l_0_2 = {
    "T1036.003:masquerading_target",
    "T1036.003:defenseevasion_target",
    "T1036.003:MasqSuspRename.I"
  }
  TrackFileAndTechnique(l_0_1, l_0_2)
end
return mp.INFECTED
