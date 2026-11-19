-- Threat: !InfrastructureShared
-- Name: 95b3fb0f939d
-- Type: 21

local l_0_0
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if l_0_0 ~= nil then
  if not sysio.IsFileExists(l_0_0) then
    return mp.CLEAN
  end
  local l_0_1 = mp.IsKnownFriendlyFile(l_0_0, true, false)
  if l_0_1 == true then
    return mp.CLEAN
  end
  local l_0_2 = sysio.GetPEVersionInfo(l_0_0)
  local l_0_3 = l_0_2 and l_0_2.OriginalFilename
  if l_0_2 == nil or l_0_3 == nil or string.lower(l_0_3) ~= "version.dll" then
    bm.add_threat_file(l_0_0)
    return mp.INFECTED
  end
end
return mp.CLEAN
