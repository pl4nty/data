-- Threat: !InfrastructureShared
-- Name: 4cb3530e93ac
-- Type: 21

local l_0_0
local l_0_1 = false
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
  if not sysio.IsFileExists(l_0_0) then
    return mp.CLEAN
  end
  local l_0_2 = mp.IsKnownFriendlyFile(l_0_0, true, false)
  if l_0_2 == true then
    return mp.CLEAN
  end
  local l_0_3 = sysio.GetPEVersionInfo(l_0_0)
  local l_0_4 = l_0_3 and l_0_3.OriginalFilename
  if l_0_3 == nil or l_0_4 == nil or string.lower(l_0_4) ~= "libcurl.dll" then
    l_0_1 = true
  end
end
if l_0_1 == true and l_0_0 ~= nil then
  bm.add_related_file(l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
