-- Threat: !InfrastructureShared
-- Name: 308b3433a0f52
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if not isnull(this_sigattrlog[15].utf8p1) then
  l_0_0 = this_sigattrlog[15].utf8p1
elseif not isnull(this_sigattrlog[16].utf8p1) then
  l_0_0 = this_sigattrlog[16].utf8p1
elseif not isnull(this_sigattrlog[17].utf8p1) then
  l_0_0 = this_sigattrlog[17].utf8p1
else
  return mp.CLEAN
end
local l_0_1 = MpCommon.PathToWin32Path(l_0_0)
if isnull(l_0_1) then
  return mp.CLEAN
end
l_0_1 = mp.ContextualExpandEnvironmentVariables(l_0_1)
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = bm.get_imagepath()
if isnull(l_0_2) then
  return mp.CLEAN
end
l_0_2 = MpCommon.PathToWin32Path(l_0_2)
if isnull(l_0_2) then
  return mp.CLEAN
end
l_0_2 = mp.ContextualExpandEnvironmentVariables(l_0_2)
if isnull(l_0_2) or not mp.IsKnownFriendlyFile(l_0_2, true, false) then
  return mp.CLEAN
end
local l_0_3 = sysio.GetPEVersionInfo(l_0_2)
if isnull(l_0_3) or l_0_3.CompanyName ~= "Microsoft Corporation" or l_0_3.ProductName ~= "Microsoft Edge" then
  return mp.CLEAN
end
local l_0_4, l_0_5 = l_0_1:match("^(.+)\\([^\\]+)$")
local l_0_6, l_0_7 = l_0_2:match("^(.+)\\([^\\]+)$")
if not (l_0_4 and l_0_6) or not string.find(string.lower(l_0_4), string.lower(l_0_6), 1, true) then
  return mp.CLEAN
end
l_0_5 = l_0_5 or l_0_1
l_0_7 = l_0_7 or l_0_2
bm.add_related_file(l_0_1)
bm.add_related_string("SuspiciousDLL", l_0_1, bm.RelatedStringBMReport)
return mp.INFECTED
