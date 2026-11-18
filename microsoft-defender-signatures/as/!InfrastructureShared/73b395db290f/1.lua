-- Threat: !InfrastructureShared
-- Name: 73b395db290f
-- Type: 21
-- Includes: TechniqueTracker

if not this_sigattrlog[2].matched then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[2].utf8p1
if not l_0_0 or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = bm.get_imagepath()
if not l_0_1 or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = string.match(string.lower(l_0_1), "([^\\]+)$")
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = {
  ["httpd.exe"] = true,
  ["php-cgi.exe"] = true,
  ["php.exe"] = true,
  ["w3wp.exe"] = true,
  ["nginx.exe"] = true
}
local l_0_4 = StringStartsWith(l_0_2, "tomcat") and StringEndsWith(l_0_2, ".exe")
if not l_0_3[l_0_2] and not l_0_4 then
  return mp.CLEAN
end
if sysio.IsFileExists(l_0_0) then
  bm.add_related_file(l_0_0)
end
TrackPidAndTechniqueBM("BM", "T1505.003", "Persistence_Webshell")
return mp.INFECTED
