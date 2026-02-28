local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
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
                L3_1 = "userinit.exe"
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
L1_1 = nil
L2_1 = nil
L3_1 = this_sigattrlog
L3_1 = L3_1[2]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[2]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= nil then
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = mp
    L4_1 = L4_1.ContextualExpandEnvironmentVariables
    L5_1 = this_sigattrlog
    L5_1 = L5_1[2]
    L5_1 = L5_1.utf8p1
    L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1)
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    L1_1 = L3_1
  end
end
L3_1 = this_sigattrlog
L3_1 = L3_1[3]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[3]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= nil then
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = mp
    L4_1 = L4_1.ContextualExpandEnvironmentVariables
    L5_1 = this_sigattrlog
    L5_1 = L5_1[3]
    L5_1 = L5_1.utf8p1
    L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1)
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    L2_1 = L3_1
  end
end
if L2_1 ~= nil and L1_1 ~= nil then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = L1_1
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 then
    L3_1 = IsDetectionThresholdMet
    L4_1 = "BM"
    L3_1 = L3_1(L4_1)
    if L3_1 then
      L3_1 = mp
      L3_1 = L3_1.INFECTED
      return L3_1
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
