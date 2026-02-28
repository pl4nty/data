local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1, L2_1, L3_1, L4_1, L5_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1)
if L0_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L0_1
  L2_1 = L2_1(L3_1)
  L3_1 = "\\program files"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = L0_1
    L2_1 = L2_1(L3_1)
    L3_1 = "teamviewer"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = string
      L2_1 = L2_1.lower
      L3_1 = L0_1
      L2_1 = L2_1(L3_1)
      L3_1 = "\\windows\\"
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if not L1_1 then
        L1_1 = string
        L1_1 = L1_1.find
        L2_1 = string
        L2_1 = L2_1.lower
        L3_1 = L0_1
        L2_1 = L2_1(L3_1)
        L3_1 = "g2mcomm.exe"
        L4_1 = 1
        L5_1 = true
        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
        if not L1_1 then
          L1_1 = string
          L1_1 = L1_1.find
          L2_1 = string
          L2_1 = L2_1.lower
          L3_1 = L0_1
          L2_1 = L2_1(L3_1)
          L3_1 = "teams"
          L4_1 = 1
          L5_1 = true
          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
          if not L1_1 then
            L1_1 = string
            L1_1 = L1_1.find
            L2_1 = string
            L2_1 = L2_1.lower
            L3_1 = L0_1
            L2_1 = L2_1(L3_1)
            L3_1 = "wintrv.exe"
            L4_1 = 1
            L5_1 = true
            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
            if not L1_1 then
              L1_1 = string
              L1_1 = L1_1.find
              L2_1 = string
              L2_1 = L2_1.lower
              L3_1 = L0_1
              L2_1 = L2_1(L3_1)
              L3_1 = "explorer.exe"
              L4_1 = 1
              L5_1 = true
              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
              if not L1_1 then
                L1_1 = string
                L1_1 = L1_1.find
                L2_1 = string
                L2_1 = L2_1.lower
                L3_1 = L0_1
                L2_1 = L2_1(L3_1)
                L3_1 = "lunc.exe"
                L4_1 = 1
                L5_1 = true
                L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                if not L1_1 then
                  L1_1 = string
                  L1_1 = L1_1.find
                  L2_1 = string
                  L2_1 = L2_1.lower
                  L3_1 = L0_1
                  L2_1 = L2_1(L3_1)
                  L3_1 = "lync.exe"
                  L4_1 = 1
                  L5_1 = true
                  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                  if not L1_1 then
                    L1_1 = string
                    L1_1 = L1_1.find
                    L2_1 = string
                    L2_1 = L2_1.lower
                    L3_1 = L0_1
                    L2_1 = L2_1(L3_1)
                    L3_1 = "rdcman.exe"
                    L4_1 = 1
                    L5_1 = true
                    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                    if not L1_1 then
                      L1_1 = string
                      L1_1 = L1_1.find
                      L2_1 = string
                      L2_1 = L2_1.lower
                      L3_1 = L0_1
                      L2_1 = L2_1(L3_1)
                      L3_1 = "youdaodict.exe"
                      L4_1 = 1
                      L5_1 = true
                      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                      if not L1_1 then
                        goto lbl_144
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
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
::lbl_144::
L1_1 = IsDetectionThresholdMet
L2_1 = "BM"
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
