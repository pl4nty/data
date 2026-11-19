-- Threat: !InfrastructureShared
-- Name: 175b3d2710ed6
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = versioning.GetOrgID()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = {
  ["26e8b179-9fbe-40fd-8f34-37cdee8c4766"] = true,
  ["e6e2b814-cd64-4ac3-9e16-91753ff30617"] = true,
  ["bcfa1838-fccc-4999-9d5b-5ec1ac1a4776"] = true,
  ["9ee8ddb9-e98f-4b86-a160-fe3b96f39cc6"] = true
}
if not l_0_1[string.lower(l_0_0)] then
  return mp.CLEAN
end
if not this_sigattrlog[2].matched then
  return mp.CLEAN
end
local l_0_2, l_0_3, l_0_4
if this_sigattrlog[3].matched and not isnull(this_sigattrlog[3].utf8p1) then
  l_0_2, l_0_3, l_0_4 = "NewAsp", this_sigattrlog[3].utf8p1, "create"
elseif this_sigattrlog[4].matched and not isnull(this_sigattrlog[4].utf8p1) then
  l_0_2, l_0_3, l_0_4 = "NewAshx", this_sigattrlog[4].utf8p1, "create"
elseif this_sigattrlog[5].matched and not isnull(this_sigattrlog[5].utf8p1) then
  l_0_2, l_0_3, l_0_4 = "NewAsmx", this_sigattrlog[5].utf8p1, "create"
elseif this_sigattrlog[6].matched and not isnull(this_sigattrlog[6].utf8p1) then
  l_0_2, l_0_3, l_0_4 = "NewAsax", this_sigattrlog[6].utf8p1, "create"
elseif this_sigattrlog[7].matched and not isnull(this_sigattrlog[7].utf8p1) then
  l_0_2, l_0_3, l_0_4 = "NewAscx", this_sigattrlog[7].utf8p1, "create"
elseif this_sigattrlog[8].matched and not isnull(this_sigattrlog[8].utf8p1) then
  l_0_2, l_0_3, l_0_4 = "NewPhp", this_sigattrlog[8].utf8p1, "create"
elseif this_sigattrlog[9].matched and not isnull(this_sigattrlog[9].utf8p1) then
  l_0_2, l_0_3, l_0_4 = "ModAsp", this_sigattrlog[9].utf8p1, "modify"
elseif this_sigattrlog[10].matched and not isnull(this_sigattrlog[10].utf8p1) then
  l_0_2, l_0_3, l_0_4 = "ModAshx", this_sigattrlog[10].utf8p1, "modify"
else
  return mp.CLEAN
end
local l_0_5 = string.lower(l_0_3)
if string.find(l_0_5, "\\temporary asp.net files\\", 1, true) then
  return mp.CLEAN
end
if string.find(l_0_5, "\\microsoft.net\\framework", 1, true) then
  return mp.CLEAN
end
if string.find(l_0_5, "\\assembly\\nativeimages", 1, true) then
  return mp.CLEAN
end
if string.find(l_0_5, "\\windows\\servicing\\", 1, true) then
  return mp.CLEAN
end
local l_0_6 = StringEndsWith(l_0_5, ".asp") or StringEndsWith(l_0_5, ".aspx") or StringEndsWith(l_0_5, ".ashx") or StringEndsWith(l_0_5, ".asmx") or StringEndsWith(l_0_5, ".asax") or StringEndsWith(l_0_5, ".ascx") or StringEndsWith(l_0_5, ".php")
if not l_0_6 then
  return mp.CLEAN
end
local l_0_7 = {
  "\\inetpub\\",
  "\\wwwroot\\",
  "\\aspnet_client\\",
  "\\web server extensions\\",
  "\\clientaccess\\",
  "\\frontend\\httpproxy\\",
  "\\owa\\",
  "\\ecp\\",
  "\\exchweb\\"
}
bm.add_related_string("iis_drop_path", l_0_3, bm.RelatedStringBMReport)
bm.add_related_string("iis_drop_op", l_0_4, bm.RelatedStringBMReport)
bm.add_related_string("iis_drop_rule", l_0_2, bm.RelatedStringBMReport)
bm.add_related_string("iis_drop_in_webroot", tostring(contains(l_0_5, l_0_7, true)), bm.RelatedStringBMReport)
if not mp.IsKnownFriendlyFile(l_0_3, true, false) then
  bm.add_related_file(l_0_3)
end
add_parents()
TrackPidAndTechniqueBM("BM", "T1505.003", "iis_webshell_drop", 28800)
return mp.INFECTED
