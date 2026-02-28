local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = 1
L1_1 = mp
L1_1 = L1_1.SIGATTR_LOG_SZ
L2_1 = 1
for L3_1 = L0_1, L1_1, L2_1 do
  L4_1 = sigattr_tail
  L4_1 = L4_1[L3_1]
  L4_1 = L4_1.matched
  if L4_1 then
    L4_1 = sigattr_tail
    L4_1 = L4_1[L3_1]
    L4_1 = L4_1.attribute
    if L4_1 == 16393 then
      L4_1 = sigattr_tail
      L4_1 = L4_1[L3_1]
      L4_1 = L4_1.utf8p1
      if L4_1 then
        L5_1 = string
        L5_1 = L5_1.lower
        L6_1 = L4_1
        L5_1 = L5_1(L6_1)
        L4_1 = L5_1
        if L4_1 then
          L5_1 = string
          L5_1 = L5_1.find
          L6_1 = L4_1
          L7_1 = "mpcmdrun.exe"
          L8_1 = 1
          L9_1 = true
          L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
          if not L5_1 then
            L5_1 = string
            L5_1 = L5_1.find
            L6_1 = L4_1
            L7_1 = "msseces.exe"
            L8_1 = 1
            L9_1 = true
            L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
            if not L5_1 then
              L5_1 = string
              L5_1 = L5_1.find
              L6_1 = L4_1
              L7_1 = "msmpeng.exe"
              L8_1 = 1
              L9_1 = true
              L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
              if not L5_1 then
                L5_1 = string
                L5_1 = L5_1.find
                L6_1 = L4_1
                L7_1 = "msascui.exe"
                L8_1 = 1
                L9_1 = true
                L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                if not L5_1 then
                  L5_1 = string
                  L5_1 = L5_1.find
                  L6_1 = L4_1
                  L7_1 = "mpuxsrv.exe"
                  L8_1 = 1
                  L9_1 = true
                  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                  if not L5_1 then
                    goto lbl_90
                  end
                end
              end
            end
          end
          L5_1 = sigattr_tail
          L5_1 = L5_1[L3_1]
          L5_1 = L5_1.utf8p2
          L6_1 = string
          L6_1 = L6_1.len
          L7_1 = L5_1
          L6_1 = L6_1(L7_1)
          if 1 <= L6_1 then
            L6_1 = TrackPidAndTechniqueBM
            L7_1 = "BM"
            L8_1 = "T1562.001"
            L9_1 = "mptamper_av"
            L6_1(L7_1, L8_1, L9_1)
            L6_1 = mp
            L6_1 = L6_1.INFECTED
            return L6_1
          end
        end
      end
    end
  end
  ::lbl_90::
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
