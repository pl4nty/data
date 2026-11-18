-- Threat: !InfrastructureShared
-- Name: 259b3cc0255cc
-- Type: 21

local l_0_0
if this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5].utf8p2
end
if this_sigattrlog[6].matched then
  l_0_0 = this_sigattrlog[6].utf8p2
end
if this_sigattrlog[7].matched then
  l_0_0 = this_sigattrlog[7].utf8p2
end
if this_sigattrlog[8].matched then
  l_0_0 = this_sigattrlog[8].utf8p2
end
if this_sigattrlog[9].matched then
  l_0_0 = this_sigattrlog[9].utf8p2
end
if this_sigattrlog[10].matched then
  l_0_0 = this_sigattrlog[10].utf8p2
end
if this_sigattrlog[11].matched then
  l_0_0 = this_sigattrlog[11].utf8p2
end
if this_sigattrlog[12].matched then
  l_0_0 = this_sigattrlog[12].utf8p2
end
if this_sigattrlog[13].matched then
  l_0_0 = this_sigattrlog[13].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_1 = string.lower(MpCommon.ExpandEnvironmentVariables("%WINDIR%\\SYSTEM32\\"))
if not l_0_0:find(l_0_1, 1, true) then
  return mp.CLEAN
end
local l_0_2 = true
if mp.IsKnownFriendlyFile(l_0_0, true, false) == false then
  bm.add_related_string("FriendlyFile", "false", bm.RelatedStringBMReport)
  l_0_2 = false
end
local l_0_3 = MpCommon.GetOriginalFileName(l_0_0)
if not l_0_3 then
  local l_0_4 = sysio.GetPEVersionInfo(l_0_0)
  if not l_0_2 and (not (l_0_4 and l_0_4.OriginalFilename) or l_0_4.OriginalFilename == "") then
    bm.add_related_string("OriginalFileName_PeParser", "null", bm.RelatedStringBMReport)
    bm.add_threat_file(l_0_0)
    return mp.INFECTED
  end
  l_0_3 = l_0_4.OriginalFilename
  MpCommon.SetOriginalFileName(l_0_0, l_0_3)
end
local l_0_5 = l_0_0:match("(%w+%.exe)$")
l_0_3 = string.lower(l_0_3)
if l_0_3 == l_0_5 and l_0_2 then
  return mp.CLEAN
end
if l_0_2 and l_0_3 == "register-cimprovider2.exe" and l_0_5 == "register-cimprovider.exe" then
  return mp.CLEAN
end
bm.add_threat_file(l_0_0)
bm.add_related_string("OriginalFileName_PeParser", l_0_0 .. "|" .. l_0_3, bm.RelatedStringBMReport)
return mp.INFECTED
