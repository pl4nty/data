local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.command_line
  if L1_1 ~= nil then
    L1_1 = L0_1.image_path
    if L1_1 ~= nil then
      goto lbl_15
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_15::
L1_1 = this_sigattrlog
L1_1 = L1_1[8]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[8]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[8]
    L1_1 = L1_1.utf8p2
    L2_1 = L1_1
    L1_1 = L1_1.match
    L3_1 = "attacksvr:([^;]+);?"
    L1_1 = L1_1(L2_1, L3_1)
    L2_1 = ExtractPartsFromUri
    L3_1 = L1_1
    L2_1 = L2_1(L3_1)
    L3_1 = L2_1.host
    if L3_1 ~= nil then
      L3_1 = L2_1.host
      if L3_1 ~= "" then
        goto lbl_43
      end
    end
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    do return L3_1 end
    ::lbl_43::
    L3_1 = IsHostAttackServerCloudChk
    L4_1 = L2_1.host
    L5_1 = "Behavior:Win32/ActiveConnToAttackerServer.H!blk"
    L6_1 = L0_1.image_path
    L7_1 = L0_1.command_line
    L8_1 = "MOTW"
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
    if L3_1 then
      L3_1 = TrackPidAndTechniqueBM
      L4_1 = L0_1.ppid
      L5_1 = L2_1.host
      L6_1 = "FirewallBlock"
      L3_1(L4_1, L5_1, L6_1)
      L3_1 = mp
      L3_1 = L3_1.INFECTED
      return L3_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
