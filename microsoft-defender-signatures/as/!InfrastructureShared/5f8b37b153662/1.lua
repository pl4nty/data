-- Threat: !InfrastructureShared
-- Name: 5f8b37b153662
-- Type: 21
-- Includes: WinRMSessionInfra, BMLuaLib, TechniqueTracker

if (this_sigattrlog[2] == nil or not this_sigattrlog[2].matched) and (this_sigattrlog[3] == nil or not this_sigattrlog[3].matched) and (this_sigattrlog[4] == nil or not this_sigattrlog[4].matched) and (this_sigattrlog[5] == nil or not this_sigattrlog[5].matched) and (this_sigattrlog[6] == nil or not this_sigattrlog[6].matched) and not IsWinRMSessionForPpid("BM", nil, nil) and not IsWinRMSessionFoundInParents("BM", nil, 4, nil) then
  return mp.CLEAN
end
local l_0_0
if this_sigattrlog[11].matched and this_sigattrlog[11].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[11].utf8p1
elseif this_sigattrlog[13].matched and this_sigattrlog[13].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[13].utf8p1
elseif this_sigattrlog[14].matched and this_sigattrlog[14].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[14].utf8p1
elseif this_sigattrlog[15].matched and this_sigattrlog[15].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[15].utf8p1
elseif this_sigattrlog[16].matched and this_sigattrlog[16].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[16].utf8p1
elseif this_sigattrlog[17].matched and this_sigattrlog[17].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[17].utf8p1
elseif this_sigattrlog[18].matched and this_sigattrlog[18].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[18].utf8p1
elseif this_sigattrlog[19].matched and this_sigattrlog[19].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[19].utf8p1
elseif this_sigattrlog[20].matched and this_sigattrlog[20].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[20].utf8p1
elseif this_sigattrlog[12].matched and this_sigattrlog[12].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[12].utf8p1
elseif this_sigattrlog[21].matched and this_sigattrlog[21].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[21].utf8p1
elseif this_sigattrlog[22].matched and this_sigattrlog[22].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[22].utf8p1
elseif this_sigattrlog[23].matched and this_sigattrlog[23].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[23].utf8p1
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if string.find(l_0_0, "\\windows\\ntds\\ntds.dit", 1, true) then
  return mp.CLEAN
end
if string.find(l_0_0, "\\windows defender\\", 1, true) then
  return mp.CLEAN
end
if string.find(l_0_0, "psscriptpolicytest", 1, true) then
  return mp.CLEAN
end
local l_0_1 = {
  "%.dll$",
  "%.exe$",
  "%.config$",
  "%.xml$",
  "%.json$",
  "%.pdb$",
  "%.nupkg$",
  "%.log$",
  "%.txt$",
  "%.ps1$",
  "%.psm1$",
  "%.psd1$",
  "%.msi$",
  "%.cab$",
  "%.zip$"
}
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if string.find(l_0_0, l_0_3) then
    return mp.CLEAN
  end
end
local l_0_4 = string.find(l_0_0, "\\temp\\", 1, true)
if l_0_4 then
  local l_0_5 = string.sub(l_0_0, l_0_4 + 6)
  local l_0_6, l_0_7 = string.gsub(l_0_5, "\\", "")
  if 2 <= l_0_7 then
    return mp.CLEAN
  end
end
local l_0_8, l_0_9
if string.find(l_0_0, "ntds.dit", 1, true) then
  l_0_9 = "ntds_file_copy"
  l_0_8 = "T1003.003"
elseif string.find(l_0_0, "lsass", 1, true) and string.find(l_0_0, ".dmp", 1, true) then
  l_0_9 = "lsass_dump"
  l_0_8 = "T1003.001"
elseif string.find(l_0_0, "globalroot", 1, true) then
  l_0_9 = "vss_ntds_copy"
  l_0_8 = "T1003.003"
elseif string.find(l_0_0, "%.sam$") or string.match(l_0_0, "\\sam$") then
  l_0_9 = "sam_hive_export"
  l_0_8 = "T1003.002"
elseif string.find(l_0_0, "%.system$") or string.match(l_0_0, "\\system$") then
  l_0_9 = "system_hive_export"
  l_0_8 = "T1003.002"
elseif string.find(l_0_0, "%.security$") or string.match(l_0_0, "\\security$") then
  l_0_9 = "security_hive_export"
  l_0_8 = "T1003.002"
end
if l_0_9 == nil then
  return mp.CLEAN
end
bm.add_related_file(l_0_0)
bm.add_related_string("WinRMCred_reason", l_0_9, bm.RelatedStringBMReport)
bm.add_related_string("WinRMCred_path", l_0_0, bm.RelatedStringBMReport)
TrackPidAndTechniqueBM("BM", l_0_8, "WinRMCredDump")
add_parents()
return mp.INFECTED
