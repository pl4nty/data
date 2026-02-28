local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = isnull
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p1
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    L1_1 = isnull
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    if not L1_1 then
      L1_1 = isnull
      L2_1 = L0_1
      L1_1 = L1_1(L2_1)
      if not L1_1 then
        L1_1 = isnull
        L2_1 = L0_1.ppid
        L1_1 = L1_1(L2_1)
        if not L1_1 then
          goto lbl_36
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_36::
L0_1 = L0_1.ppid
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.utf8p2
L2_1 = string
L2_1 = L2_1.match
L3_1 = this_sigattrlog
L3_1 = L3_1[1]
L3_1 = L3_1.utf8p1
L4_1 = "ProcessReparent (.-) from .- to (.-) as new parent of: (.+)"
L2_1, L3_1, L4_1 = L2_1(L3_1, L4_1)
L5_1 = isnull
L6_1 = L2_1
L5_1 = L5_1(L6_1)
if not L5_1 then
  L5_1 = isnull
  L6_1 = L3_1
  L5_1 = L5_1(L6_1)
  if not L5_1 then
    L5_1 = isnull
    L6_1 = L4_1
    L5_1 = L5_1(L6_1)
    if not L5_1 then
      goto lbl_65
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_65::
L5_1 = nil
if L2_1 == "injected" then
  L5_1 = L1_1
else
  L6_1 = this_sigattrlog
  L6_1 = L6_1[3]
  L6_1 = L6_1.matched
  if L6_1 then
    L6_1 = isnull
    L7_1 = this_sigattrlog
    L7_1 = L7_1[3]
    L7_1 = L7_1.utf8p1
    L6_1 = L6_1(L7_1)
    if not L6_1 then
      L6_1 = this_sigattrlog
      L6_1 = L6_1[3]
      L5_1 = L6_1.utf8p1
  end
  else
    L6_1 = this_sigattrlog
    L6_1 = L6_1[4]
    L6_1 = L6_1.matched
    if L6_1 then
      L6_1 = isnull
      L7_1 = this_sigattrlog
      L7_1 = L7_1[4]
      L7_1 = L7_1.utf8p1
      L6_1 = L6_1(L7_1)
      if not L6_1 then
        L6_1 = this_sigattrlog
        L6_1 = L6_1[4]
        L5_1 = L6_1.utf8p1
    end
    else
      L6_1 = this_sigattrlog
      L6_1 = L6_1[5]
      L6_1 = L6_1.matched
      if L6_1 then
        L6_1 = isnull
        L7_1 = this_sigattrlog
        L7_1 = L7_1[5]
        L7_1 = L7_1.utf8p1
        L6_1 = L6_1(L7_1)
        if not L6_1 then
          L6_1 = this_sigattrlog
          L6_1 = L6_1[5]
          L5_1 = L6_1.utf8p1
      end
      else
        L6_1 = this_sigattrlog
        L6_1 = L6_1[6]
        L6_1 = L6_1.matched
        if L6_1 then
          L6_1 = isnull
          L7_1 = this_sigattrlog
          L7_1 = L7_1[6]
          L7_1 = L7_1.utf8p1
          L6_1 = L6_1(L7_1)
          if not L6_1 then
            L6_1 = this_sigattrlog
            L6_1 = L6_1[6]
            L5_1 = L6_1.utf8p1
          end
        end
      end
    end
  end
end
L6_1 = isnull
L7_1 = L5_1
L6_1 = L6_1(L7_1)
if L6_1 or L5_1 ~= L1_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = bm
L6_1 = L6_1.add_related_string
L7_1 = "ProcessSpoofSummary"
L8_1 = string
L8_1 = L8_1.format
L9_1 = "This process %s %s to spoof as parent of %s."
L10_1 = L2_1
L11_1 = L3_1
L12_1 = L4_1
L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
L9_1 = bm
L9_1 = L9_1.RelatedStringBMReport
L6_1(L7_1, L8_1, L9_1)
L6_1 = bm
L6_1 = L6_1.add_related_process
L7_1 = L4_1
L6_1(L7_1)
L6_1 = TrackPidAndTechniqueBM
L7_1 = L4_1
L8_1 = "T1564.010"
L9_1 = "spoofargs_child"
L6_1(L7_1, L8_1, L9_1)
L6_1 = TrackPidAndTechniqueBM
L7_1 = L4_1
L8_1 = "T1134.004"
L9_1 = "spoofparent_child"
L6_1(L7_1, L8_1, L9_1)
L6_1 = bm
L6_1 = L6_1.add_related_process
L7_1 = L3_1
L6_1(L7_1)
L6_1 = TrackPidAndTechniqueBM
L7_1 = L3_1
L8_1 = "T1564.010"
L9_1 = "spoofargs_fakeparent"
L6_1(L7_1, L8_1, L9_1)
L6_1 = TrackPidAndTechniqueBM
L7_1 = L3_1
L8_1 = "T1134.004"
L9_1 = "spoofparent_fakeparent"
L6_1(L7_1, L8_1, L9_1)
L6_1 = TrackPidAndTechniqueBM
L7_1 = L0_1
L8_1 = "T1564.010"
L9_1 = "spoofargs_realparent"
L6_1(L7_1, L8_1, L9_1)
L6_1 = TrackPidAndTechniqueBM
L7_1 = L0_1
L8_1 = "T1134.004"
L9_1 = "spoofparent_realparent"
L6_1(L7_1, L8_1, L9_1)
L6_1 = mp
L6_1 = L6_1.INFECTED
return L6_1
