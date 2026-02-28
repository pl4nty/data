local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = MpCommon
L0_1 = L0_1.GetPersistContextCountNoPath
L1_1 = "UACBypassExp.T!regset"
L0_1 = L0_1(L1_1)
if 0 < L0_1 then
  L0_1 = MpCommon
  L0_1 = L0_1.GetPersistContextNoPath
  L1_1 = "UACBypassExp.T!regset"
  L0_1 = L0_1(L1_1)
  if L0_1 then
    L1_1 = ipairs
    L2_1 = L0_1
    L1_1, L2_1, L3_1 = L1_1(L2_1)
    for L4_1, L5_1 in L1_1, L2_1, L3_1 do
      L6_1 = string
      L6_1 = L6_1.match
      L7_1 = string
      L7_1 = L7_1.lower
      L8_1 = L5_1
      L7_1 = L7_1(L8_1)
      L8_1 = " (.+)$"
      L6_1 = L6_1(L7_1, L8_1)
      L7_1 = 1
      L8_1 = mp
      L8_1 = L8_1.SIGATTR_LOG_SZ
      L9_1 = 1
      for L10_1 = L7_1, L8_1, L9_1 do
        L11_1 = sigattr_head
        L11_1 = L11_1[L10_1]
        L11_1 = L11_1.matched
        if L11_1 then
          L11_1 = sigattr_head
          L11_1 = L11_1[L10_1]
          L11_1 = L11_1.attribute
          if L11_1 == 16400 then
            L11_1 = string
            L11_1 = L11_1.lower
            L12_1 = sigattr_head
            L12_1 = L12_1[L10_1]
            L12_1 = L12_1.utf8p2
            L11_1 = L11_1(L12_1)
            L12_1 = string
            L12_1 = L12_1.gsub
            L13_1 = L11_1
            L14_1 = "\""
            L15_1 = ""
            L12_1 = L12_1(L13_1, L14_1, L15_1)
            L11_1 = L12_1
            L12_1 = string
            L12_1 = L12_1.len
            L13_1 = L11_1
            L12_1 = L12_1(L13_1)
            if 4 < L12_1 then
              L12_1 = string
              L12_1 = L12_1.find
              L13_1 = L11_1
              L14_1 = string
              L14_1 = L14_1.lower
              L15_1 = L5_1
              L14_1 = L14_1(L15_1)
              L15_1 = 1
              L16_1 = true
              L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
              if L12_1 then
                L12_1 = TrackPidAndTechniqueBM
                L13_1 = "BM"
                L14_1 = "T1548.002"
                L15_1 = "uac_bypass_trg"
                L12_1(L13_1, L14_1, L15_1)
                L12_1 = mp
                L12_1 = L12_1.INFECTED
                return L12_1
              end
            end
            L12_1 = string
            L12_1 = L12_1.match
            L13_1 = string
            L13_1 = L13_1.lower
            L14_1 = sigattr_head
            L14_1 = L14_1[L10_1]
            L14_1 = L14_1.utf8p2
            L13_1 = L13_1(L14_1)
            L14_1 = " (.+)$"
            L12_1 = L12_1(L13_1, L14_1)
            if L12_1 and L6_1 then
              L13_1 = string
              L13_1 = L13_1.len
              L14_1 = L12_1
              L13_1 = L13_1(L14_1)
              if 4 < L13_1 and L12_1 == L6_1 then
                L13_1 = TrackPidAndTechniqueBM
                L14_1 = "BM"
                L15_1 = "T1548.002"
                L16_1 = "uac_bypass_trg"
                L13_1(L14_1, L15_1, L16_1)
                L13_1 = mp
                L13_1 = L13_1.INFECTED
                return L13_1
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
