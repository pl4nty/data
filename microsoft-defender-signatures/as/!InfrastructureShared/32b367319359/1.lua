-- Threat: !InfrastructureShared
-- Name: 32b367319359
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if not this_sigattrlog[1].matched or isnull(this_sigattrlog[1].utf8p2) then
  return mp.CLEAN
end
local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
local l_0_1 = string.find(l_0_0, "\\inetpub\\wwwroot", 1, true) or string.find(l_0_0, "/inetpub/wwwroot", 1, true)
if not l_0_1 then
  return mp.CLEAN
end
if not string.find(l_0_0, "/grant", 1, true) then
  return mp.CLEAN
end
local l_0_2 = string.find(l_0_0, "iis_users", 1, true) or string.find(l_0_0, "iis_iusrs", 1, true) or string.find(l_0_0, "iis users", 1, true) or string.find(l_0_0, "iis iusrs", 1, true)
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = string.find(l_0_0, ":(rx)", 1, true) or string.find(l_0_0, ":rx", 1, true) or string.find(l_0_0, "(r,x)", 1, true)
if not l_0_3 then
  return mp.CLEAN
end
local l_0_4 = string.find(l_0_0, ".aspx", 1, true) or string.find(l_0_0, ".asp", 1, true) or string.find(l_0_0, ".ashx", 1, true) or string.find(l_0_0, ".asmx", 1, true) or string.find(l_0_0, ".ps1", 1, true) or string.find(l_0_0, ".exe", 1, true) or string.find(l_0_0, ".dll", 1, true)
if not l_0_4 then
  return mp.CLEAN
end
bm.add_related_string("iis_webroot_acl_cmd", this_sigattrlog[1].utf8p2, bm.RelatedStringBMReport)
add_parents()
TrackPidAndTechniqueBM("BM", "T1222.001", "iis_webroot_acl_grant", 28800)
TrackPidAndTechniqueBM("BM", "T1505.003", "iis_webroot_acl_grant", 28800)
return mp.INFECTED
