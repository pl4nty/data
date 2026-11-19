-- Threat: !InfrastructureShared
-- Name: 38b3fd9d3b8c
-- Type: 21
-- Includes: TechniqueTracker

function is_target(l_1_0)
  if string.find(l_1_0, "kobdrvapi", 1, true) ~= nil then
    return false
  end
  if string.find(l_1_0, "appxprovider", 1, true) ~= nil then
    return false
  end
  if string.find(l_1_0, "dbghelp", 1, true) ~= nil then
    return false
  end
  return true
end

local l_0_0, l_0_1
if this_sigattrlog[1].matched then
  if this_sigattrlog[1].utf8p1 ~= nil then
    l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
  end
  if this_sigattrlog[1].utf8p2 ~= nil then
    l_0_1 = string.lower(this_sigattrlog[1].utf8p2)
  end
end
if l_0_0 ~= nil and sysio.IsFileExists(l_0_0) then
  if is_target(l_0_0) then
    bm.add_related_file(l_0_0)
  else
    return mp.CLEAN
  end
end
if l_0_1 ~= nil and sysio.IsFileExists(l_0_1) then
  if is_target(l_0_1) then
    bm.add_related_file(l_0_1)
    MpCommon.AppendPersistContext(l_0_1, "MasqSuspCopyTarget", 3600)
    local l_0_2 = {
      "T1036.003:masquerading_target",
      "T1036.003:defenseevasion_target",
      "T1036.003:MasqSuspCopy.B"
    }
    TrackFileAndTechnique(l_0_1, l_0_2)
  else
    return mp.CLEAN
  end
end
return mp.INFECTED
