local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.utf8p2
  if L0_1 ~= nil then
    L0_1 = string
    L0_1 = L0_1.lower
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L1_1 = L1_1.utf8p2
    L0_1 = L0_1(L1_1)
    if L0_1 then
      L1_1 = mp
      L1_1 = L1_1.IsKnownFriendlyFile
      L2_1 = L0_1
      L3_1 = true
      L4_1 = false
      L1_1 = L1_1(L2_1, L3_1, L4_1)
      if L1_1 == true then
        L1_1 = mp
        L1_1 = L1_1.CLEAN
        return L1_1
      end
      L1_1 = string
      L1_1 = L1_1.match
      L2_1 = string
      L2_1 = L2_1.lower
      L3_1 = this_sigattrlog
      L3_1 = L3_1[1]
      L3_1 = L3_1.utf8p1
      L2_1 = L2_1(L3_1)
      L3_1 = "\\services\\([^\\]+)\\parameters"
      L1_1 = L1_1(L2_1, L3_1)
      L2_1 = MpCommon
      L2_1 = L2_1.QueryPersistContext
      L3_1 = L1_1
      L4_1 = "NewServiceCreation"
      L2_1 = L2_1(L3_1, L4_1)
      if not L2_1 then
        L3_1 = MpCommon
        L3_1 = L3_1.AppendPersistContext
        L4_1 = L1_1
        L5_1 = "NewServiceCreation"
        L6_1 = 0
        L3_1(L4_1, L5_1, L6_1)
      end
      L3_1 = sysio
      L3_1 = L3_1.GetFileLastWriteTime
      L4_1 = L0_1
      L3_1 = L3_1(L4_1)
      L4_1 = sysio
      L4_1 = L4_1.GetLastResult
      L4_1 = L4_1()
      L4_1 = L4_1.Success
      if L4_1 and L3_1 ~= 0 then
        L4_1 = L3_1 / 10000000
        L3_1 = L4_1 - 11644473600
        L4_1 = MpCommon
        L4_1 = L4_1.GetCurrentTimeT
        L4_1 = L4_1()
        if not (L3_1 > L4_1) then
          L5_1 = L4_1 - L3_1
          if not (600 < L5_1) then
            goto lbl_78
          end
        end
        L5_1 = mp
        L5_1 = L5_1.CLEAN
        do return L5_1 end
        ::lbl_78::
        L5_1 = bm_AddRelatedFileFromCommandLine
        L6_1 = L0_1
        L5_1(L6_1)
        L5_1 = mp
        L5_1 = L5_1.INFECTED
        return L5_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
