-- Threat: !InfrastructureShared
-- Name: 114b3a086383d
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4, l_0_5, l_0_6, l_0_7, l_0_8
if this_sigattrlog[4].matched then
  l_0_1 = this_sigattrlog[4].utf8p1
  l_0_3 = string.match(l_0_1, "\\([^\\]+)$")
  l_0_0 = this_sigattrlog[4].ppid
elseif this_sigattrlog[5].matched then
  l_0_2 = this_sigattrlog[5].utf8p1
  l_0_4 = string.match(l_0_2, "\\([^\\]+)$")
  l_0_0 = this_sigattrlog[5].ppid
elseif this_sigattrlog[6].matched then
  l_0_5 = this_sigattrlog[6].utf8p1
elseif this_sigattrlog[7].matched then
  l_0_6 = this_sigattrlog[7].utf8p1
elseif this_sigattrlog[8].matched then
  l_0_7 = this_sigattrlog[8].utf8p1
elseif this_sigattrlog[9].matched then
  l_0_8 = this_sigattrlog[9].utf8p1
end
if l_0_1 == nil and l_0_2 == nil or l_0_5 == nil and l_0_6 == nil or l_0_7 == nil and l_0_8 == nil or l_0_3 == nil and l_0_4 == nil or l_0_0 == nil then
  return mp.CLEAN
end
if l_0_3 == l_0_5 or l_0_3 == l_0_6 or l_0_4 == l_0_5 or l_0_4 == l_0_6 then
  bm.request_SMS(l_0_0, "h+")
  TrackPidAndTechniqueBM("BM", "T1055.002", "portable_executable_injection")
  return mp.INFECTED
end
return mp.CLEAN
