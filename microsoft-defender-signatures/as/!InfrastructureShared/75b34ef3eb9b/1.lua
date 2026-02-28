local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
if L0_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "fsprocsvc.exe"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = pcall
L2_1 = bm
L2_1 = L2_1.get_current_process_startup_info
L1_1, L2_1 = L1_1(L2_1)
if L1_1 and L2_1 ~= nil then
  L3_1 = L2_1.ppid
  if L3_1 ~= nil then
    L4_1 = IsTechniqueObservedForPid
    L5_1 = L3_1
    L6_1 = "T1036"
    L4_1 = L4_1(L5_1, L6_1)
    if L4_1 then
      L4_1 = TrackPidAndTechniqueBM
      L5_1 = "BM"
      L6_1 = "T1059"
      L7_1 = "commandscriptmasq"
      L4_1(L5_1, L6_1, L7_1)
      L4_1 = bm
      L4_1 = L4_1.get_process_relationships
      L4_1, L5_1 = L4_1()
      L6_1 = nil
      L7_1 = ipairs
      L8_1 = L5_1
      L7_1, L8_1, L9_1 = L7_1(L8_1)
      for L10_1, L11_1 in L7_1, L8_1, L9_1 do
        L12_1 = mp
        L12_1 = L12_1.bitand
        L13_1 = L11_1.reason_ex
        L14_1 = 1
        L12_1 = L12_1(L13_1, L14_1)
        if L12_1 == 1 then
          L13_1 = string
          L13_1 = L13_1.find
          L14_1 = string
          L14_1 = L14_1.lower
          L15_1 = L11_1.image_path
          L14_1 = L14_1(L15_1)
          L15_1 = "\\cmd.exe\\"
          L16_1 = 1
          L17_1 = true
          L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
          if not L13_1 then
            L13_1 = string
            L13_1 = L13_1.find
            L14_1 = string
            L14_1 = L14_1.lower
            L15_1 = L11_1.image_path
            L14_1 = L14_1(L15_1)
            L15_1 = "\\powershell.exe\\"
            L16_1 = 1
            L17_1 = true
            L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
            if not L13_1 then
              L13_1 = string
              L13_1 = L13_1.find
              L14_1 = string
              L14_1 = L14_1.lower
              L15_1 = L11_1.image_path
              L14_1 = L14_1(L15_1)
              L15_1 = "\\wscript.exe\\"
              L16_1 = 1
              L17_1 = true
              L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
              if not L13_1 then
                L13_1 = string
                L13_1 = L13_1.find
                L14_1 = string
                L14_1 = L14_1.lower
                L15_1 = L11_1.image_path
                L14_1 = L14_1(L15_1)
                L15_1 = "\\cscript.exe\\"
                L16_1 = 1
                L17_1 = true
                L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
                if not L13_1 then
                  L13_1 = string
                  L13_1 = L13_1.find
                  L14_1 = string
                  L14_1 = L14_1.lower
                  L15_1 = L11_1.image_path
                  L14_1 = L14_1(L15_1)
                  L15_1 = "\\mshta.exe\\"
                  L16_1 = 1
                  L17_1 = true
                  L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
                  if not L13_1 then
                    goto lbl_124
                  end
                end
              end
            end
          end
          L6_1 = L11_1.ppid
          L13_1 = TrackPidAndTechniqueBM
          L14_1 = L6_1
          L15_1 = "T1059"
          L16_1 = "commandscriptmasq"
          L13_1(L14_1, L15_1, L16_1)
        end
        ::lbl_124::
      end
      L7_1 = mp
      L7_1 = L7_1.INFECTED
      return L7_1
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
