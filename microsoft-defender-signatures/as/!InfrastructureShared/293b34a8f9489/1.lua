local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.ppid
  if L1_1 ~= nil then
    goto lbl_12
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_12::
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = L1_1.ppid
  if L2_1 ~= nil then
    goto lbl_23
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_23::
L2_1 = isParentPackageManager
L3_1 = L1_1.ppid
L4_1 = true
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = {}
L3_1 = this_sigattrlog
L3_1 = L3_1[11]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[11]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= nil then
    L3_1 = table
    L3_1 = L3_1.insert
    L4_1 = L2_1
    L5_1 = string
    L5_1 = L5_1.lower
    L6_1 = this_sigattrlog
    L6_1 = L6_1[11]
    L6_1 = L6_1.utf8p1
    L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1 = L5_1(L6_1)
    L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1)
  end
end
L3_1 = this_sigattrlog
L3_1 = L3_1[12]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[12]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= nil then
    L3_1 = table
    L3_1 = L3_1.insert
    L4_1 = L2_1
    L5_1 = string
    L5_1 = L5_1.lower
    L6_1 = this_sigattrlog
    L6_1 = L6_1[12]
    L6_1 = L6_1.utf8p1
    L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1 = L5_1(L6_1)
    L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1)
  end
end
L3_1 = this_sigattrlog
L3_1 = L3_1[13]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[13]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= nil then
    L3_1 = table
    L3_1 = L3_1.insert
    L4_1 = L2_1
    L5_1 = string
    L5_1 = L5_1.lower
    L6_1 = this_sigattrlog
    L6_1 = L6_1[13]
    L6_1 = L6_1.utf8p1
    L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1 = L5_1(L6_1)
    L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1)
  end
end
L3_1 = this_sigattrlog
L3_1 = L3_1[14]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[14]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= nil then
    L3_1 = table
    L3_1 = L3_1.insert
    L4_1 = L2_1
    L5_1 = string
    L5_1 = L5_1.lower
    L6_1 = this_sigattrlog
    L6_1 = L6_1[14]
    L6_1 = L6_1.utf8p1
    L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1 = L5_1(L6_1)
    L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1)
  end
end
L3_1 = this_sigattrlog
L3_1 = L3_1[15]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[15]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= nil then
    L3_1 = table
    L3_1 = L3_1.insert
    L4_1 = L2_1
    L5_1 = string
    L5_1 = L5_1.lower
    L6_1 = this_sigattrlog
    L6_1 = L6_1[15]
    L6_1 = L6_1.utf8p1
    L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1 = L5_1(L6_1)
    L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1)
  end
end
L3_1 = this_sigattrlog
L3_1 = L3_1[16]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[16]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= nil then
    L3_1 = table
    L3_1 = L3_1.insert
    L4_1 = L2_1
    L5_1 = string
    L5_1 = L5_1.lower
    L6_1 = this_sigattrlog
    L6_1 = L6_1[16]
    L6_1 = L6_1.utf8p1
    L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1 = L5_1(L6_1)
    L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1)
  end
end
L3_1 = this_sigattrlog
L3_1 = L3_1[17]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[17]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= nil then
    L3_1 = table
    L3_1 = L3_1.insert
    L4_1 = L2_1
    L5_1 = string
    L5_1 = L5_1.lower
    L6_1 = this_sigattrlog
    L6_1 = L6_1[17]
    L6_1 = L6_1.utf8p1
    L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1 = L5_1(L6_1)
    L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1)
  end
end
L3_1 = this_sigattrlog
L3_1 = L3_1[18]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[18]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= nil then
    L3_1 = table
    L3_1 = L3_1.insert
    L4_1 = L2_1
    L5_1 = string
    L5_1 = L5_1.lower
    L6_1 = this_sigattrlog
    L6_1 = L6_1[18]
    L6_1 = L6_1.utf8p1
    L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1 = L5_1(L6_1)
    L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1)
  end
end
L3_1 = this_sigattrlog
L3_1 = L3_1[19]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[19]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= nil then
    L3_1 = table
    L3_1 = L3_1.insert
    L4_1 = L2_1
    L5_1 = string
    L5_1 = L5_1.lower
    L6_1 = this_sigattrlog
    L6_1 = L6_1[19]
    L6_1 = L6_1.utf8p1
    L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1 = L5_1(L6_1)
    L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1)
  end
end
L3_1 = this_sigattrlog
L3_1 = L3_1[20]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[20]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= nil then
    L3_1 = table
    L3_1 = L3_1.insert
    L4_1 = L2_1
    L5_1 = string
    L5_1 = L5_1.lower
    L6_1 = this_sigattrlog
    L6_1 = L6_1[20]
    L6_1 = L6_1.utf8p1
    L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1 = L5_1(L6_1)
    L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1)
  end
end
L3_1 = #L2_1
if L3_1 < 3 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = {}
L4_1 = "/var/tmp/"
L5_1 = "/tmp/"
L6_1 = "/root/"
L7_1 = "/run/"
L8_1 = "/var/run/"
L9_1 = "/home/"
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L3_1[5] = L8_1
L3_1[6] = L9_1
L4_1 = {}
L5_1 = "/bin/"
L6_1 = "/usr/bin/"
L7_1 = "/sbin/"
L8_1 = "/usr/sbin/"
L4_1[1] = L5_1
L4_1[2] = L6_1
L4_1[3] = L7_1
L4_1[4] = L8_1
L5_1 = 0
L6_1 = 0
L7_1 = 0
L8_1 = 0
L9_1 = 0
L10_1 = 0
L11_1 = ipairs
L12_1 = L2_1
L11_1, L12_1, L13_1 = L11_1(L12_1)
for L14_1, L15_1 in L11_1, L12_1, L13_1 do
  L16_1 = bm
  L16_1 = L16_1.add_related_file
  L17_1 = L15_1
  L16_1(L17_1)
  L16_1 = ipairs
  L17_1 = L3_1
  L16_1, L17_1, L18_1 = L16_1(L17_1)
  for L19_1, L20_1 in L16_1, L17_1, L18_1 do
    L22_1 = L15_1
    L21_1 = L15_1.sub
    L23_1 = 1
    L24_1 = #L20_1
    L21_1 = L21_1(L22_1, L23_1, L24_1)
    if L21_1 == L20_1 then
      L5_1 = L5_1 + 1
    end
  end
  L16_1 = ipairs
  L17_1 = L4_1
  L16_1, L17_1, L18_1 = L16_1(L17_1)
  for L19_1, L20_1 in L16_1, L17_1, L18_1 do
    L22_1 = L15_1
    L21_1 = L15_1.sub
    L23_1 = 1
    L24_1 = #L20_1
    L21_1 = L21_1(L22_1, L23_1, L24_1)
    if L21_1 == L20_1 then
      L6_1 = L6_1 + 1
    end
  end
  L17_1 = L15_1
  L16_1 = L15_1.sub
  L18_1 = 1
  L19_1 = 5
  L16_1 = L16_1(L17_1, L18_1, L19_1)
  if L16_1 == "/etc/" then
    L8_1 = L8_1 + 1
  end
  L17_1 = L15_1
  L16_1 = L15_1.sub
  L18_1 = 1
  L19_1 = 5
  L16_1 = L16_1(L17_1, L18_1, L19_1)
  if L16_1 == "/mnt/" then
    L7_1 = L7_1 + 1
  end
  L17_1 = L15_1
  L16_1 = L15_1.sub
  L18_1 = 1
  L19_1 = 9
  L16_1 = L16_1(L17_1, L18_1, L19_1)
  if L16_1 == "/srv/ftp/" then
    L9_1 = L9_1 + 1
  end
  L17_1 = L15_1
  L16_1 = L15_1.sub
  L18_1 = 1
  L19_1 = 9
  L16_1 = L16_1(L17_1, L18_1, L19_1)
  if L16_1 == "/dev/shm/" then
    L10_1 = L10_1 + 1
  end
end
if 7 < L5_1 then
  L11_1 = TrackPidAndTechniqueBM
  L12_1 = "BM"
  L13_1 = "T1070.004"
  L14_1 = "DefenseEvasion_IndicatorRemoval_FileDeletion_WWD"
  L11_1(L12_1, L13_1, L14_1)
end
if 7 < L6_1 then
  L11_1 = TrackPidAndTechniqueBM
  L12_1 = "BM"
  L13_1 = "T1070.004"
  L14_1 = "DefenseEvasion_IndicatorRemoval_FileDeletion_BenignPath"
  L11_1(L12_1, L13_1, L14_1)
end
if 7 < L8_1 then
  L11_1 = TrackPidAndTechniqueBM
  L12_1 = "BM"
  L13_1 = "T1070.004"
  L14_1 = "DefenseEvasion_IndicatorRemoval_FileDeletion_EtcPath"
  L11_1(L12_1, L13_1, L14_1)
end
if 7 < L7_1 then
  L11_1 = TrackPidAndTechniqueBM
  L12_1 = "BM"
  L13_1 = "T1070.004"
  L14_1 = "DefenseEvasion_IndicatorRemoval_FileDeletion_MntPath"
  L11_1(L12_1, L13_1, L14_1)
end
if 7 < L9_1 then
  L11_1 = TrackPidAndTechniqueBM
  L12_1 = "BM"
  L13_1 = "T1070.004"
  L14_1 = "DefenseEvasion_IndicatorRemoval_FileDeletion_FtpPath"
  L11_1(L12_1, L13_1, L14_1)
end
if 7 < L10_1 then
  L11_1 = TrackPidAndTechniqueBM
  L12_1 = "BM"
  L13_1 = "T1070.004"
  L14_1 = "DefenseEvasion_IndicatorRemoval_FileDeletion_DevPath"
  L11_1(L12_1, L13_1, L14_1)
end
L11_1 = table
L11_1 = L11_1.concat
L12_1 = L2_1
L13_1 = ","
L11_1 = L11_1(L12_1, L13_1)
L12_1 = bm
L12_1 = L12_1.add_related_string
L13_1 = "file_metadata"
L14_1 = L11_1
L15_1 = bm
L15_1 = L15_1.RelatedStringBMReport
L12_1(L13_1, L14_1, L15_1)
L12_1 = TrackPidAndTechniqueBM
L13_1 = "BM"
L14_1 = "T1070.004"
L15_1 = "DefenseEvasion_IndicatorRemoval_FileDeletion_F12"
L12_1(L13_1, L14_1, L15_1)
L12_1 = addRelatedProcess
L12_1()
L12_1 = reportRelatedBmHits
L12_1()
L12_1 = mp
L12_1 = L12_1.INFECTED
return L12_1
