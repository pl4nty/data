-- Threat: !InfrastructureShared
-- Name: 1b7b3ae027e98
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[6].utf8p1
end
if not l_0_0 then
  return mp.CLEAN
end
if mp.IsKnownFriendlyFile(l_0_0, true, false) then
  return mp.CLEAN
end
local l_0_1
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[4].utf8p1
end
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[5].utf8p1
end
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = l_0_0:match("^(.*)\\")
local l_0_3 = l_0_1:match("^(.*)\\")
if l_0_2 ~= l_0_3 then
  return mp.CLEAN
end
local l_0_4 = sysio.GetPEVersionInfo(l_0_1) or {}
if l_0_4.OriginalFilename and contains(l_0_4.OriginalFilename, {
  "U3BoostSvr",
  "AgentInstall",
  "USHSVC"
}) or l_0_4.LegalCopyright and contains(l_0_4.LegalCopyright, "asus") then
  local l_0_5 = (l_0_4.OriginalFilename or "") .. "|" .. (l_0_4.CompanyName or "") .. "|" .. (l_0_4.LegalCopyright or "")
  bm.add_related_string("version_info", l_0_5, bm.RelatedStringBMReport)
  bm.add_related_string("BinaryPaths", l_0_1 .. "|" .. l_0_0, bm.RelatedStringBMReport)
  bm.add_related_file(l_0_1)
  bm.add_threat_file(l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
