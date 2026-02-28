local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1 = L1_1()
L2_1 = ""
L3_1 = 0
L4_1 = bm
L4_1 = L4_1.get_current_process_startup_info
L4_1 = L4_1()
if L4_1 then
  L5_1 = L4_1.ppid
  if L5_1 then
    L3_1 = L4_1.ppid
  end
end
if L1_1 == nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = this_sigattrlog
L5_1 = L5_1[1]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[1]
  L5_1 = L5_1.utf8p2
  if L5_1 ~= nil then
    L5_1 = this_sigattrlog
    L5_1 = L5_1[1]
    L0_1 = L5_1.utf8p2
    L2_1 = "BM_fsutil_symlink"
end
else
  L5_1 = this_sigattrlog
  L5_1 = L5_1[2]
  L5_1 = L5_1.matched
  if L5_1 then
    L5_1 = this_sigattrlog
    L5_1 = L5_1[2]
    L5_1 = L5_1.utf8p2
    if L5_1 ~= nil then
      L5_1 = this_sigattrlog
      L5_1 = L5_1[2]
      L0_1 = L5_1.utf8p2
      L2_1 = "BM_iisreset_stop"
  end
  else
    L5_1 = this_sigattrlog
    L5_1 = L5_1[3]
    L5_1 = L5_1.matched
    if L5_1 then
      L5_1 = this_sigattrlog
      L5_1 = L5_1[3]
      L5_1 = L5_1.utf8p2
      if L5_1 ~= nil then
        L5_1 = this_sigattrlog
        L5_1 = L5_1[3]
        L0_1 = L5_1.utf8p2
        L2_1 = "BM_VSS_Shadowcopy"
    end
    else
      L5_1 = this_sigattrlog
      L5_1 = L5_1[4]
      L5_1 = L5_1.matched
      if L5_1 then
        L5_1 = this_sigattrlog
        L5_1 = L5_1[4]
        L5_1 = L5_1.utf8p2
        if L5_1 ~= nil then
          L5_1 = this_sigattrlog
          L5_1 = L5_1[4]
          L0_1 = L5_1.utf8p2
          L2_1 = "BM_WMIC_Shadowcopy"
      end
      else
        L5_1 = this_sigattrlog
        L5_1 = L5_1[5]
        L5_1 = L5_1.matched
        if L5_1 then
          L5_1 = this_sigattrlog
          L5_1 = L5_1[5]
          L5_1 = L5_1.utf8p2
          if L5_1 ~= nil then
            L5_1 = this_sigattrlog
            L5_1 = L5_1[5]
            L0_1 = L5_1.utf8p2
            L2_1 = "BM_bcdedit_Shadowcopy"
        end
        else
          L5_1 = this_sigattrlog
          L5_1 = L5_1[6]
          L5_1 = L5_1.matched
          if L5_1 then
            L5_1 = this_sigattrlog
            L5_1 = L5_1[6]
            L5_1 = L5_1.utf8p2
            if L5_1 ~= nil then
              L5_1 = this_sigattrlog
              L5_1 = L5_1[6]
              L0_1 = L5_1.utf8p2
              L2_1 = "BM_bcdedit_Shadowcopy"
          end
          else
            L5_1 = this_sigattrlog
            L5_1 = L5_1[7]
            L5_1 = L5_1.matched
            if L5_1 then
              L5_1 = this_sigattrlog
              L5_1 = L5_1[7]
              L5_1 = L5_1.utf8p2
              if L5_1 ~= nil then
                L5_1 = this_sigattrlog
                L5_1 = L5_1[7]
                L0_1 = L5_1.utf8p2
                L2_1 = "BM_clearlog"
            end
            else
              L5_1 = this_sigattrlog
              L5_1 = L5_1[8]
              L5_1 = L5_1.matched
              if L5_1 then
                L5_1 = this_sigattrlog
                L5_1 = L5_1[8]
                L5_1 = L5_1.utf8p2
                if L5_1 ~= nil then
                  L5_1 = this_sigattrlog
                  L5_1 = L5_1[8]
                  L0_1 = L5_1.utf8p2
                  L2_1 = "masskill"
              end
              else
                L5_1 = this_sigattrlog
                L5_1 = L5_1[9]
                L5_1 = L5_1.matched
                if L5_1 then
                  L5_1 = this_sigattrlog
                  L5_1 = L5_1[9]
                  L5_1 = L5_1.utf8p2
                  if L5_1 ~= nil then
                    L5_1 = this_sigattrlog
                    L5_1 = L5_1[9]
                    L0_1 = L5_1.utf8p2
                    L2_1 = "masskill"
                end
                else
                  L5_1 = this_sigattrlog
                  L5_1 = L5_1[10]
                  L5_1 = L5_1.matched
                  if L5_1 then
                    L5_1 = this_sigattrlog
                    L5_1 = L5_1[10]
                    L5_1 = L5_1.utf8p2
                    if L5_1 ~= nil then
                      L5_1 = this_sigattrlog
                      L5_1 = L5_1[10]
                      L0_1 = L5_1.utf8p2
                      L2_1 = "masskill"
                  end
                  else
                    L5_1 = this_sigattrlog
                    L5_1 = L5_1[11]
                    L5_1 = L5_1.matched
                    if L5_1 then
                      L5_1 = this_sigattrlog
                      L5_1 = L5_1[11]
                      L5_1 = L5_1.utf8p2
                      if L5_1 ~= nil then
                        L5_1 = this_sigattrlog
                        L5_1 = L5_1[11]
                        L0_1 = L5_1.utf8p2
                        L2_1 = "BM_GenRansom"
                    end
                    else
                      L5_1 = this_sigattrlog
                      L5_1 = L5_1[12]
                      L5_1 = L5_1.matched
                      if L5_1 then
                        L5_1 = this_sigattrlog
                        L5_1 = L5_1[12]
                        L5_1 = L5_1.utf8p2
                        if L5_1 ~= nil then
                          L5_1 = this_sigattrlog
                          L5_1 = L5_1[12]
                          L0_1 = L5_1.utf8p2
                          L2_1 = "RansomNote"
                      end
                      else
                        L5_1 = this_sigattrlog
                        L5_1 = L5_1[13]
                        L5_1 = L5_1.matched
                        if L5_1 then
                          L5_1 = this_sigattrlog
                          L5_1 = L5_1[13]
                          L5_1 = L5_1.utf8p2
                          if L5_1 ~= nil then
                            L5_1 = this_sigattrlog
                            L5_1 = L5_1[13]
                            L0_1 = L5_1.utf8p2
                            L2_1 = "RansomNote"
                        end
                        else
                          L5_1 = this_sigattrlog
                          L5_1 = L5_1[14]
                          L5_1 = L5_1.matched
                          if L5_1 then
                            L5_1 = this_sigattrlog
                            L5_1 = L5_1[14]
                            L5_1 = L5_1.utf8p2
                            if L5_1 ~= nil then
                              L5_1 = this_sigattrlog
                              L5_1 = L5_1[14]
                              L0_1 = L5_1.utf8p2
                              L2_1 = "RansomNote"
                          end
                          else
                            L5_1 = this_sigattrlog
                            L5_1 = L5_1[15]
                            L5_1 = L5_1.matched
                            if L5_1 then
                              L5_1 = this_sigattrlog
                              L5_1 = L5_1[15]
                              L5_1 = L5_1.utf8p2
                              if L5_1 ~= nil then
                                L5_1 = this_sigattrlog
                                L5_1 = L5_1[15]
                                L0_1 = L5_1.utf8p2
                                L2_1 = "RansomNote"
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
if L2_1 == "masskill" then
  L5_1 = AddToAtomicCounter
  L6_1 = L2_1
  L7_1 = 1
  L8_1 = 600
  L5_1 = L5_1(L6_1, L7_1, L8_1)
  if 10 <= L5_1 then
    L2_1 = "BM_masskill"
  end
end
if L2_1 == "RansomNote" then
  L5_1 = AddToAtomicCounter
  L6_1 = L2_1
  L7_1 = 1
  L8_1 = 600
  L5_1 = L5_1(L6_1, L7_1, L8_1)
  if 5 <= L5_1 then
    L2_1 = "BM_RansomNote"
  end
end
L5_1 = StringStartsWith
L6_1 = L2_1
L7_1 = "BM_"
L5_1 = L5_1(L6_1, L7_1)
if L5_1 then
  L5_1 = MpCommon
  L5_1 = L5_1.DoesProcessHaveAttribute
  L6_1 = L3_1
  L7_1 = L2_1
  L5_1 = L5_1(L6_1, L7_1)
  if not L5_1 then
    L5_1 = MpCommon
    L5_1 = L5_1.DoesProcessHaveAttribute
    L6_1 = L3_1
    L7_1 = "inherit:"
    L8_1 = L2_1
    L7_1 = L7_1 .. L8_1
    L5_1 = L5_1(L6_1, L7_1)
    if not L5_1 then
      goto lbl_289
    end
  end
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  do return L5_1 end
  ::lbl_289::
  L5_1 = MpCommon
  L5_1 = L5_1.AddProcessAttribute
  L6_1 = L3_1
  L7_1 = L2_1
  L8_1 = L0_1
  L9_1 = false
  L5_1(L6_1, L7_1, L8_1, L9_1)
  L5_1 = MpCommon
  L5_1 = L5_1.GetProcessAttributes
  L6_1 = L3_1
  L5_1 = L5_1(L6_1)
  L6_1 = #L5_1
  if 3 < L6_1 then
    L6_1 = bm
    L6_1 = L6_1.add_related_string
    L7_1 = "RanProcAttrib"
    L8_1 = safeJsonSerialize
    L9_1 = L5_1
    L8_1 = L8_1(L9_1)
    L9_1 = bm
    L9_1 = L9_1.RelatedStringBMReport
    L6_1(L7_1, L8_1, L9_1)
    L6_1 = mp
    L6_1 = L6_1.INFECTED
    return L6_1
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
