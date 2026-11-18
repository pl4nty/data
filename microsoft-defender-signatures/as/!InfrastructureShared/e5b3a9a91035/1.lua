-- Threat: !InfrastructureShared
-- Name: e5b3a9a91035
-- Type: 21

if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p1 then
  local l_0_0 = bm.get_imagepath()
  if l_0_0 == nil then
    return mp.CLEAN
  end
  l_0_0 = MpCommon.PathToWin32Path(l_0_0)
  l_0_0 = string.lower(l_0_0)
  if l_0_0 == nil or string.sub(l_0_0, -12) ~= "\\msmpeng.exe" then
    return mp.CLEAN
  end
  if not mp.IsKnownFriendlyFile(l_0_0, true, false) then
    return mp.CLEAN
  end
  local l_0_1 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[6].utf8p1)
  if l_0_1 == nil then
    return mp.CLEAN
  end
  l_0_1 = string.lower(l_0_1)
  if mp.IsKnownFriendlyFile(l_0_1, true, false) then
    return mp.CLEAN
  end
  bm.add_related_file(l_0_1)
  return mp.INFECTED
end
return mp.CLEAN
