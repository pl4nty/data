-- Threat: !InfrastructureShared
-- Name: 131b3acd1b382
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0, l_0_1, l_0_2, l_0_3
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].ppid
elseif this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].ppid
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].ppid
end
if this_sigattrlog[4].matched then
  l_0_2 = this_sigattrlog[4].utf8p1
elseif this_sigattrlog[5].matched then
  l_0_2 = this_sigattrlog[5].utf8p1
elseif this_sigattrlog[6].matched then
  l_0_2 = this_sigattrlog[6].utf8p1
end
if this_sigattrlog[7].matched then
  l_0_1 = this_sigattrlog[7].ppid
end
if this_sigattrlog[8].matched then
  l_0_3 = this_sigattrlog[8].utf8p1
end
if l_0_0 == nil or l_0_1 == nil or l_0_2 == nil or l_0_3 == nil then
  return mp.CLEAN
end
if isTainted(l_0_2, "remote_file_created_taint") then
  taint(l_0_3, "remote_file_created_taint", 3600)
  TrackPidAndTechniqueBM("BM", "T1105", "CommandAndControl")
  return mp.INFECTED
end
return mp.CLEAN
