-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\293b34a8f9489\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetParentProcInfo)()
if l_0_1 == nil or l_0_1.ppid == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_1.ppid, true) then
  return mp.CLEAN
end
local l_0_2 = {}
if (this_sigattrlog[11]).matched and (this_sigattrlog[11]).utf8p1 ~= nil then
  (table.insert)(l_0_2, (string.lower)((this_sigattrlog[11]).utf8p1))
end
if (this_sigattrlog[12]).matched and (this_sigattrlog[12]).utf8p1 ~= nil then
  (table.insert)(l_0_2, (string.lower)((this_sigattrlog[12]).utf8p1))
end
if (this_sigattrlog[13]).matched and (this_sigattrlog[13]).utf8p1 ~= nil then
  (table.insert)(l_0_2, (string.lower)((this_sigattrlog[13]).utf8p1))
end
if (this_sigattrlog[14]).matched and (this_sigattrlog[14]).utf8p1 ~= nil then
  (table.insert)(l_0_2, (string.lower)((this_sigattrlog[14]).utf8p1))
end
if (this_sigattrlog[15]).matched and (this_sigattrlog[15]).utf8p1 ~= nil then
  (table.insert)(l_0_2, (string.lower)((this_sigattrlog[15]).utf8p1))
end
if (this_sigattrlog[16]).matched and (this_sigattrlog[16]).utf8p1 ~= nil then
  (table.insert)(l_0_2, (string.lower)((this_sigattrlog[16]).utf8p1))
end
if (this_sigattrlog[17]).matched and (this_sigattrlog[17]).utf8p1 ~= nil then
  (table.insert)(l_0_2, (string.lower)((this_sigattrlog[17]).utf8p1))
end
if (this_sigattrlog[18]).matched and (this_sigattrlog[18]).utf8p1 ~= nil then
  (table.insert)(l_0_2, (string.lower)((this_sigattrlog[18]).utf8p1))
end
if (this_sigattrlog[19]).matched and (this_sigattrlog[19]).utf8p1 ~= nil then
  (table.insert)(l_0_2, (string.lower)((this_sigattrlog[19]).utf8p1))
end
if (this_sigattrlog[20]).matched and (this_sigattrlog[20]).utf8p1 ~= nil then
  (table.insert)(l_0_2, (string.lower)((this_sigattrlog[20]).utf8p1))
end
if #l_0_2 < 3 then
  return mp.CLEAN
end
local l_0_3 = {}
-- DECOMPILER ERROR at PC245: No list found for R3 , SetList fails

local l_0_4 = {}
-- DECOMPILER ERROR at PC247: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC248: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC249: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC250: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC251: No list found for R4 , SetList fails

-- DECOMPILER ERROR at PC252: Overwrote pending register: R5 in 'AssignReg'

local l_0_5 = "/tmp/"
-- DECOMPILER ERROR at PC253: Overwrote pending register: R6 in 'AssignReg'

local l_0_6 = "/root/"
-- DECOMPILER ERROR at PC254: Overwrote pending register: R7 in 'AssignReg'

local l_0_7 = "/run/"
-- DECOMPILER ERROR at PC255: Overwrote pending register: R8 in 'AssignReg'

local l_0_8 = "/var/run/"
-- DECOMPILER ERROR at PC256: Overwrote pending register: R9 in 'AssignReg'

local l_0_9 = "/home/"
local l_0_10 = 0
for l_0_14,l_0_15 in ipairs(l_0_2) do
  (bm.add_related_file)(l_0_15)
  for l_0_19,l_0_20 in ipairs(l_0_3) do
    if l_0_15:sub(1, #l_0_20) == l_0_20 then
      l_0_5 = l_0_5 + 1
    end
  end
  for l_0_24,l_0_25 in ipairs(l_0_4) do
    if l_0_15:sub(1, #l_0_25) == l_0_25 then
      l_0_6 = l_0_6 + 1
    end
  end
  if l_0_15:sub(1, 5) == "/etc/" then
    l_0_8 = l_0_8 + 1
  end
  if l_0_15:sub(1, 5) == "/mnt/" then
    l_0_7 = l_0_7 + 1
  end
  if l_0_15:sub(1, 9) == "/srv/ftp/" then
    l_0_9 = l_0_9 + 1
  end
  if l_0_15:sub(1, 9) == "/dev/shm/" then
    l_0_10 = l_0_10 + 1
  end
end
if l_0_5 > 7 then
  TrackPidAndTechniqueBM("BM", "T1070.004", "DefenseEvasion_IndicatorRemoval_FileDeletion_WWD")
end
if l_0_6 > 7 then
  TrackPidAndTechniqueBM("BM", "T1070.004", "DefenseEvasion_IndicatorRemoval_FileDeletion_BenignPath")
end
if l_0_8 > 7 then
  TrackPidAndTechniqueBM("BM", "T1070.004", "DefenseEvasion_IndicatorRemoval_FileDeletion_EtcPath")
end
if l_0_7 > 7 then
  TrackPidAndTechniqueBM("BM", "T1070.004", "DefenseEvasion_IndicatorRemoval_FileDeletion_MntPath")
end
if l_0_9 > 7 then
  TrackPidAndTechniqueBM("BM", "T1070.004", "DefenseEvasion_IndicatorRemoval_FileDeletion_FtpPath")
end
if l_0_10 > 7 then
  TrackPidAndTechniqueBM("BM", "T1070.004", "DefenseEvasion_IndicatorRemoval_FileDeletion_DevPath")
end
local l_0_26 = (table.concat)(l_0_2, ",")
;
(bm.add_related_string)("file_metadata", l_0_26, bm.RelatedStringBMReport)
TrackPidAndTechniqueBM("BM", "T1070.004", "DefenseEvasion_IndicatorRemoval_FileDeletion_F12")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED

