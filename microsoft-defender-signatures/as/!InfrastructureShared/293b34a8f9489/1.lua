-- Threat: !InfrastructureShared
-- Name: 293b34a8f9489
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetParentProcInfo()
if l_0_1 == nil or l_0_1.ppid == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_1.ppid, true) then
  return mp.CLEAN
end
local l_0_2 = {}
if this_sigattrlog[11].matched and this_sigattrlog[11].utf8p1 ~= nil then
  table.insert(l_0_2, string.lower(this_sigattrlog[11].utf8p1))
end
if this_sigattrlog[12].matched and this_sigattrlog[12].utf8p1 ~= nil then
  table.insert(l_0_2, string.lower(this_sigattrlog[12].utf8p1))
end
if this_sigattrlog[13].matched and this_sigattrlog[13].utf8p1 ~= nil then
  table.insert(l_0_2, string.lower(this_sigattrlog[13].utf8p1))
end
if this_sigattrlog[14].matched and this_sigattrlog[14].utf8p1 ~= nil then
  table.insert(l_0_2, string.lower(this_sigattrlog[14].utf8p1))
end
if this_sigattrlog[15].matched and this_sigattrlog[15].utf8p1 ~= nil then
  table.insert(l_0_2, string.lower(this_sigattrlog[15].utf8p1))
end
if this_sigattrlog[16].matched and this_sigattrlog[16].utf8p1 ~= nil then
  table.insert(l_0_2, string.lower(this_sigattrlog[16].utf8p1))
end
if this_sigattrlog[17].matched and this_sigattrlog[17].utf8p1 ~= nil then
  table.insert(l_0_2, string.lower(this_sigattrlog[17].utf8p1))
end
if this_sigattrlog[18].matched and this_sigattrlog[18].utf8p1 ~= nil then
  table.insert(l_0_2, string.lower(this_sigattrlog[18].utf8p1))
end
if this_sigattrlog[19].matched and this_sigattrlog[19].utf8p1 ~= nil then
  table.insert(l_0_2, string.lower(this_sigattrlog[19].utf8p1))
end
if this_sigattrlog[20].matched and this_sigattrlog[20].utf8p1 ~= nil then
  table.insert(l_0_2, string.lower(this_sigattrlog[20].utf8p1))
end
if #l_0_2 < 3 then
  return mp.CLEAN
end
local l_0_3 = {
  "/var/tmp/",
  "/tmp/",
  "/root/",
  "/run/",
  "/var/run/",
  "/home/"
}
local l_0_4 = {
  "/bin/",
  "/usr/bin/",
  "/sbin/",
  "/usr/sbin/"
}
local l_0_5 = 0
local l_0_6 = 0
local l_0_7 = 0
local l_0_8 = 0
local l_0_9 = 0
local l_0_10 = 0
for l_0_11, l_0_12 in ipairs(l_0_2) do
  bm.add_related_file(l_0_12)
  for l_0_13, l_0_14 in ipairs(l_0_3) do
    if l_0_12:sub(1, #l_0_14) == l_0_14 then
      l_0_5 = l_0_5 + 1
    end
  end
  for l_0_15, l_0_16 in ipairs(l_0_4) do
    if l_0_12:sub(1, #l_0_16) == l_0_16 then
      l_0_6 = l_0_6 + 1
    end
  end
  if l_0_12:sub(1, 5) == "/etc/" then
    l_0_8 = l_0_8 + 1
  end
  if l_0_12:sub(1, 5) == "/mnt/" then
    l_0_7 = l_0_7 + 1
  end
  if l_0_12:sub(1, 9) == "/srv/ftp/" then
    l_0_9 = l_0_9 + 1
  end
  if l_0_12:sub(1, 9) == "/dev/shm/" then
    l_0_10 = l_0_10 + 1
  end
end
if 7 < l_0_5 then
  TrackPidAndTechniqueBM("BM", "T1070.004", "DefenseEvasion_IndicatorRemoval_FileDeletion_WWD")
end
if 7 < l_0_6 then
  TrackPidAndTechniqueBM("BM", "T1070.004", "DefenseEvasion_IndicatorRemoval_FileDeletion_BenignPath")
end
if 7 < l_0_8 then
  TrackPidAndTechniqueBM("BM", "T1070.004", "DefenseEvasion_IndicatorRemoval_FileDeletion_EtcPath")
end
if 7 < l_0_7 then
  TrackPidAndTechniqueBM("BM", "T1070.004", "DefenseEvasion_IndicatorRemoval_FileDeletion_MntPath")
end
if 7 < l_0_9 then
  TrackPidAndTechniqueBM("BM", "T1070.004", "DefenseEvasion_IndicatorRemoval_FileDeletion_FtpPath")
end
if 7 < l_0_10 then
  TrackPidAndTechniqueBM("BM", "T1070.004", "DefenseEvasion_IndicatorRemoval_FileDeletion_DevPath")
end
local l_0_17 = table.concat(l_0_2, ",")
bm.add_related_string("file_metadata", l_0_17, bm.RelatedStringBMReport)
TrackPidAndTechniqueBM("BM", "T1070.004", "DefenseEvasion_IndicatorRemoval_FileDeletion_F12")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
