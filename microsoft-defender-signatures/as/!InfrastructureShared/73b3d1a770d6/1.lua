local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
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
L1_1 = isParentPackageManager
L2_1 = L0_1.ppid
L3_1 = true
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = nil
L2_1 = 0
L3_1 = this_sigattrlog
L3_1 = L3_1[3]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[3]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= nil then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[3]
    L3_1 = L3_1.np2
    if L3_1 ~= nil then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[3]
      L1_1 = L3_1.utf8p1
      L3_1 = this_sigattrlog
      L3_1 = L3_1[3]
      L2_1 = L3_1.np2
    end
  end
end
if L1_1 == nil or L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = tonumber
L4_1 = tostring
L5_1 = L2_1
L4_1 = L4_1(L5_1)
L5_1 = 8
L3_1 = L3_1(L4_1, L5_1)
L4_1 = mp
L4_1 = L4_1.bsplit
L5_1 = L3_1
L6_1 = 3
L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1, L6_1)
if L4_1 == 0 and L5_1 == 0 and L6_1 == 0 and L7_1 == 0 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = bm
L8_1 = L8_1.get_imagepath
L8_1 = L8_1()
if L8_1 == nil then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L9_1 = "BM"
L10_1 = string
L10_1 = L10_1.find
L11_1 = L8_1
L12_1 = "/chmod"
L13_1 = -6
L14_1 = true
L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
if L10_1 then
  L9_1 = L0_1.ppid
end
L10_1 = false
L11_1 = mp
L11_1 = L11_1.bitand
L12_1 = L4_1
L13_1 = 1
L11_1 = L11_1(L12_1, L13_1)
if L11_1 ~= 1 then
  L11_1 = mp
  L11_1 = L11_1.bitand
  L12_1 = L5_1
  L13_1 = 1
  L11_1 = L11_1(L12_1, L13_1)
  if L11_1 ~= 1 then
    L11_1 = mp
    L11_1 = L11_1.bitand
    L12_1 = L6_1
    L13_1 = 1
    L11_1 = L11_1(L12_1, L13_1)
    if L11_1 ~= 1 then
      goto lbl_134
    end
  end
end
if L9_1 == "BM" then
  L11_1 = bm
  L11_1 = L11_1.trigger_sig
  L12_1 = "ChmodToExec"
  L13_1 = L1_1
  L11_1(L12_1, L13_1)
else
  L11_1 = bm
  L11_1 = L11_1.trigger_sig
  L12_1 = "ChmodToExec"
  L13_1 = L1_1
  L14_1 = L9_1
  L11_1(L12_1, L13_1, L14_1)
end
L11_1 = TrackPidAndTechniqueBM
L12_1 = L9_1
L13_1 = "T1222"
L14_1 = "DefenseEvasion_PermissionModification_ChmodToExec"
L11_1(L12_1, L13_1, L14_1)
L10_1 = true
::lbl_134::
L11_1 = mp
L11_1 = L11_1.bitand
L12_1 = L7_1
L13_1 = 2
L11_1 = L11_1(L12_1, L13_1)
if L11_1 ~= 2 then
  L11_1 = mp
  L11_1 = L11_1.bitand
  L12_1 = L7_1
  L13_1 = 4
  L11_1 = L11_1(L12_1, L13_1)
  if L11_1 ~= 4 then
    goto lbl_168
  end
end
if L9_1 == "BM" then
  L11_1 = bm
  L11_1 = L11_1.trigger_sig
  L12_1 = "UidGidChange"
  L13_1 = L1_1
  L11_1(L12_1, L13_1)
else
  L11_1 = bm
  L11_1 = L11_1.trigger_sig
  L12_1 = "UidGidChange"
  L13_1 = L1_1
  L14_1 = L9_1
  L11_1(L12_1, L13_1, L14_1)
end
L11_1 = TrackPidAndTechniqueBM
L12_1 = L9_1
L13_1 = "T1548.001"
L14_1 = "PrivilegeEscalation_AbuseElevationControlMechanism_SetuidSetgid"
L11_1(L12_1, L13_1, L14_1)
L10_1 = true
::lbl_168::
if L10_1 == false then
  L11_1 = mp
  L11_1 = L11_1.CLEAN
  return L11_1
end
L11_1 = bm
L11_1 = L11_1.add_related_file
L12_1 = L1_1
L11_1(L12_1)
L11_1 = addRelatedProcess
L11_1()
L11_1 = mp
L11_1 = L11_1.INFECTED
return L11_1
