local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = {}
L1_1 = {}
L2_1 = "python"
L3_1 = "/var/lib/waagent"
L1_1[1] = L2_1
L1_1[2] = L3_1
L2_1 = {}
L3_1 = "/lib/systemd/systemd"
L4_1 = "/lib/systemd/systemd"
L2_1[1] = L3_1
L2_1[2] = L4_1
L3_1 = {}
L4_1 = "sapstartsrv"
L5_1 = "/usr/sap/"
L3_1[1] = L4_1
L3_1[2] = L5_1
L0_1[1] = L1_1
L0_1[2] = L2_1
L0_1[3] = L3_1
L1_1 = "remote_file_created_taint"
L2_1 = nil
L3_1 = nil
L4_1 = nil
L5_1 = this_sigattrlog
L5_1 = L5_1[3]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[3]
  L2_1 = L5_1.ppid
  L5_1 = this_sigattrlog
  L5_1 = L5_1[3]
  L3_1 = L5_1.image_path
  L5_1 = this_sigattrlog
  L5_1 = L5_1[3]
  L4_1 = L5_1.utf8p2
end
L5_1 = mp
L5_1 = L5_1.GetParentProcInfo
L5_1 = L5_1()
if L3_1 ~= nil and L5_1 ~= nil then
  L6_1 = L5_1.image_path
  if L6_1 ~= nil then
    L6_1 = isTainted
    L7_1 = L5_1.image_path
    L8_1 = L1_1
    L6_1 = L6_1(L7_1, L8_1)
    if not L6_1 then
      L6_1 = isTainted
      L7_1 = L3_1
      L8_1 = L1_1
      L6_1 = L6_1(L7_1, L8_1)
      if not L6_1 then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
    end
  end
end
if L3_1 ~= nil and L4_1 ~= nil then
  L6_1 = ipairs
  L7_1 = L0_1
  L6_1, L7_1, L8_1 = L6_1(L7_1)
  for L9_1, L10_1 in L6_1, L7_1, L8_1 do
    L11_1 = L10_1[1]
    L12_1 = L10_1[2]
    L13_1 = string
    L13_1 = L13_1.find
    L14_1 = L3_1
    L15_1 = L11_1
    L16_1 = 1
    L17_1 = true
    L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
    if L13_1 then
      L13_1 = string
      L13_1 = L13_1.find
      L14_1 = L4_1
      L15_1 = L12_1
      L16_1 = 1
      L17_1 = true
      L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
      if L13_1 then
        L13_1 = mp
        L13_1 = L13_1.CLEAN
        return L13_1
      end
    end
  end
end
if L2_1 ~= nil then
  L6_1 = isParentPackageManager
  L7_1 = L2_1
  L8_1 = true
  L6_1 = L6_1(L7_1, L8_1)
  if not L6_1 then
    L6_1 = checkParentCmdline
    L7_1 = L2_1
    L8_1 = L0_1
    L9_1 = 2
    L6_1 = L6_1(L7_1, L8_1, L9_1)
    if not L6_1 then
      L6_1 = versioning
      L6_1 = L6_1.GetCloudBlockLevel
      L6_1 = L6_1()
      if 4 <= L6_1 then
        L6_1 = TrackPidAndTechniqueBM
        L7_1 = L2_1
        L8_1 = "T1543.002"
        L9_1 = "Persistence"
        L6_1(L7_1, L8_1, L9_1)
        L6_1 = addRelatedProcess
        L6_1()
        L6_1 = reportRelatedBmHits
        L6_1()
        L6_1 = mp
        L6_1 = L6_1.INFECTED
        return L6_1
      end
    end
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
