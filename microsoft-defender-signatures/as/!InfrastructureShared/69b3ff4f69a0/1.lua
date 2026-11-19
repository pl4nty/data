-- Threat: !InfrastructureShared
-- Name: 69b3ff4f69a0
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1
if this_sigattrlog[2].matched then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
elseif this_sigattrlog[3].matched then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p1)
elseif this_sigattrlog[4].matched then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p1)
elseif this_sigattrlog[5].matched then
  l_0_0 = string.lower(this_sigattrlog[5].utf8p1)
end
if l_0_0 then
  l_0_1 = string.match(l_0_0, "/([^/]+)$")
  if (sysio.IsFileExists("/bin/" .. l_0_1) or sysio.IsFileExists("/sbin/" .. l_0_1) or sysio.IsFileExists("/usr/bin/" .. l_0_1) or sysio.IsFileExists("/usr/sbin/" .. l_0_1)) and string.find(l_0_0, "/bin/" .. l_0_1, -(5 + string.len(l_0_1)), true) == nil then
    TrackPidAndTechniqueBM("BM", "T1036", "Masquerading")
    return mp.INFECTED
  end
end
return mp.CLEAN
