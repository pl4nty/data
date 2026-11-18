-- Threat: !InfrastructureShared
-- Name: 113b34f3ae017
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil then
  l_0_0 = string.lower(l_0_0)
  if l_0_0.find(l_0_0, "\\clicktorun\\officeclicktorun.exe", 1, true) ~= nil then
    return mp.CLEAN
  end
end
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_1 = this_sigattrlog[1].utf8p2
  if sysio.IsFileExists(l_0_1) and mp.IsKnownFriendlyFile(l_0_1, true, false) == false then
    bm.add_related_file(l_0_1)
    return mp.INFECTED
  end
end
return mp.CLEAN
