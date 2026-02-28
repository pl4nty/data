local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = this_sigattrlog
L0_1 = L0_1[3]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[3]
  L0_1 = L0_1.utf8p2
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[2]
    L0_1 = L0_1.matched
    if L0_1 then
      L0_1 = this_sigattrlog
      L0_1 = L0_1[2]
      L0_1 = L0_1.utf8p1
      if L0_1 ~= nil then
        L0_1 = string
        L0_1 = L0_1.lower
        L1_1 = this_sigattrlog
        L1_1 = L1_1[2]
        L1_1 = L1_1.utf8p1
        L0_1 = L0_1(L1_1)
        L1_1 = mp
        L1_1 = L1_1.SIGATTR_LOG_SZ
        L2_1 = 1
        L3_1 = L1_1
        L4_1 = 1
        for L5_1 = L2_1, L3_1, L4_1 do
          L6_1 = sigattr_tail
          L6_1 = L6_1[L5_1]
          L6_1 = L6_1.attribute
          if L6_1 == 16470 then
            L6_1 = string
            L6_1 = L6_1.find
            L7_1 = sigattr_tail
            L7_1 = L7_1[L5_1]
            L7_1 = L7_1.utf8p2
            L8_1 = L0_1
            L9_1 = 1
            L10_1 = true
            L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
            if L6_1 ~= nil then
              L6_1 = sysio
              L6_1 = L6_1.GetFileLastWriteTime
              L7_1 = L0_1
              L6_1 = L6_1(L7_1)
              L7_1 = sysio
              L7_1 = L7_1.GetLastResult
              L7_1 = L7_1()
              L7_1 = L7_1.Success
              if L7_1 and L6_1 ~= 0 then
                L7_1 = L6_1 / 10000000
                L6_1 = L7_1 - 11644473600
                L7_1 = MpCommon
                L7_1 = L7_1.GetCurrentTimeT
                L7_1 = L7_1()
                if not (L6_1 > L7_1) then
                  L8_1 = L7_1 - L6_1
                  if not (600 < L8_1) then
                    goto lbl_74
                  end
                end
                L8_1 = mp
                L8_1 = L8_1.CLEAN
                do return L8_1 end
                ::lbl_74::
                L8_1 = bm_AddRelatedFileFromCommandLine
                L9_1 = L0_1
                L8_1(L9_1)
                L8_1 = mp
                L8_1 = L8_1.INFECTED
                return L8_1
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
return L0_1
