-- Threat: !InfrastructureShared
-- Name: deb3cc602fae
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1, l_0_2
if this_sigattrlog[2].matched and this_sigattrlog[2] ~= nil and this_sigattrlog[2] ~= "" then
  l_0_1 = string.lower(this_sigattrlog[2].utf8p1)
elseif this_sigattrlog[3].matched and this_sigattrlog[3] ~= nil and this_sigattrlog[3] ~= "" then
  l_0_1 = string.lower(this_sigattrlog[3].utf8p1)
end
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
for l_0_3 = 1, l_0_0 do
  if sigattr_tail[l_0_3].attribute == 16384 then
    l_0_2 = sigattr_tail[l_0_3].utf8p1:lower()
    if l_0_2 == l_0_1 then
      return mp.CLEAN
    end
  end
end
TrackPidAndTechniqueBM("BM", "T1647", "DefenseEvasion_PlistFileModification")
mp.set_mpattribute("BM_PlistModification")
return mp.INFECTED
