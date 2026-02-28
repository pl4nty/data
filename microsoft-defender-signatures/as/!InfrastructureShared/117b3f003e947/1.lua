local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = this_sigattrlog
L0_1 = L0_1[6]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[6]
  L0_1 = L0_1.utf8p1
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[6]
    L0_1 = L0_1.utf8p1
    if L0_1 ~= "" then
      L0_1 = this_sigattrlog
      L0_1 = L0_1[6]
      L0_1 = L0_1.utf8p2
      if L0_1 ~= nil then
        L0_1 = this_sigattrlog
        L0_1 = L0_1[6]
        L0_1 = L0_1.utf8p2
        if L0_1 ~= "" then
          L0_1 = this_sigattrlog
          L0_1 = L0_1[7]
          L0_1 = L0_1.matched
          if L0_1 then
            L0_1 = this_sigattrlog
            L0_1 = L0_1[7]
            L0_1 = L0_1.utf8p2
            if L0_1 ~= nil then
              L0_1 = this_sigattrlog
              L0_1 = L0_1[7]
              L0_1 = L0_1.utf8p2
              if L0_1 ~= "" then
                goto lbl_44
              end
            end
          end
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_44::
L0_1 = this_sigattrlog
L0_1 = L0_1[6]
L0_1 = L0_1.utf8p1
L1_1 = this_sigattrlog
L1_1 = L1_1[6]
L1_1 = L1_1.utf8p2
L2_1 = IsExcludedByCmdlineMacOS
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = IsExcludedByImagePathMacOS
  L3_1 = L0_1
  L2_1 = L2_1(L3_1)
  if not L2_1 then
    goto lbl_63
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_63::
L2_1 = this_sigattrlog
L2_1 = L2_1[7]
L2_1 = L2_1.utf8p2
L3_1 = SuspMacPathsToMonitor
L4_1 = L0_1
L5_1 = true
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = TrackPidAndTechniqueBM
  L4_1 = "BM"
  L5_1 = "T1070.006"
  L6_1 = "DefenseEvasion_IndicatorRemoval_MacTimeStompToPast"
  L3_1(L4_1, L5_1, L6_1)
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L4_1 = L2_1
L3_1 = L2_1.match
L5_1 = "[^/]*$"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 == nil or L3_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.find
L5_1 = L1_1
L6_1 = L3_1
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 then
  L4_1 = bm
  L4_1 = L4_1.trigger_sig
  L5_1 = "SuspTimeStompedToSelf"
  L6_1 = L2_1
  L4_1(L5_1, L6_1)
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
