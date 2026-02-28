local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = pcall
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L0_1, L1_1 = L0_1(L1_1)
if L0_1 and L1_1 ~= nil then
  L2_1 = L1_1.ppid
  if L2_1 ~= nil then
    L3_1 = IsTechniqueObservedForPid
    L4_1 = L2_1
    L5_1 = "T1027.002"
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 then
      L3_1 = IsDetectionThresholdMet
      L4_1 = "BM"
      L3_1 = L3_1(L4_1)
      if L3_1 then
        L3_1 = TrackPidAndTechniqueBM
        L4_1 = "BM"
        L5_1 = "T1059"
        L6_1 = "commandscriptpacked"
        L3_1(L4_1, L5_1, L6_1)
        L3_1 = bm
        L3_1 = L3_1.get_process_relationships
        L3_1, L4_1 = L3_1()
        L5_1 = nil
        L6_1 = ipairs
        L7_1 = L4_1
        L6_1, L7_1, L8_1 = L6_1(L7_1)
        for L9_1, L10_1 in L6_1, L7_1, L8_1 do
          L11_1 = mp
          L11_1 = L11_1.bitand
          L12_1 = L10_1.reason_ex
          L13_1 = 1
          L11_1 = L11_1(L12_1, L13_1)
          if L11_1 == 1 then
            L12_1 = string
            L12_1 = L12_1.find
            L13_1 = string
            L13_1 = L13_1.lower
            L14_1 = L10_1.image_path
            L13_1 = L13_1(L14_1)
            L14_1 = "\\cmd.exe\\"
            L15_1 = 1
            L16_1 = true
            L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
            if not L12_1 then
              L12_1 = string
              L12_1 = L12_1.find
              L13_1 = string
              L13_1 = L13_1.lower
              L14_1 = L10_1.image_path
              L13_1 = L13_1(L14_1)
              L14_1 = "\\powershell.exe\\"
              L15_1 = 1
              L16_1 = true
              L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
              if not L12_1 then
                L12_1 = string
                L12_1 = L12_1.find
                L13_1 = string
                L13_1 = L13_1.lower
                L14_1 = L10_1.image_path
                L13_1 = L13_1(L14_1)
                L14_1 = "\\wscript.exe\\"
                L15_1 = 1
                L16_1 = true
                L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
                if not L12_1 then
                  L12_1 = string
                  L12_1 = L12_1.find
                  L13_1 = string
                  L13_1 = L13_1.lower
                  L14_1 = L10_1.image_path
                  L13_1 = L13_1(L14_1)
                  L14_1 = "\\cscript.exe\\"
                  L15_1 = 1
                  L16_1 = true
                  L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
                  if not L12_1 then
                    L12_1 = string
                    L12_1 = L12_1.find
                    L13_1 = string
                    L13_1 = L13_1.lower
                    L14_1 = L10_1.image_path
                    L13_1 = L13_1(L14_1)
                    L14_1 = "\\mshta.exe\\"
                    L15_1 = 1
                    L16_1 = true
                    L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
                    if not L12_1 then
                      goto lbl_109
                    end
                  end
                end
              end
            end
            L5_1 = L10_1.ppid
            L12_1 = TrackPidAndTechniqueBM
            L13_1 = L5_1
            L14_1 = "T1059"
            L15_1 = "commandscriptpackedthreshold"
            L12_1(L13_1, L14_1, L15_1)
          end
          ::lbl_109::
        end
        L6_1 = mp
        L6_1 = L6_1.INFECTED
        return L6_1
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
