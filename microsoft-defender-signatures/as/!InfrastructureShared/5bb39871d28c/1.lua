local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = 2
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L1_1 = L1_1.utf8p2
    if L1_1 then
      L1_1 = safeJsonDeserialize
      L2_1 = this_sigattrlog
      L2_1 = L2_1[1]
      L2_1 = L2_1.utf8p2
      L1_1 = L1_1(L2_1)
      L2_1 = isnull
      L3_1 = L1_1
      L2_1 = L2_1(L3_1)
      if not L2_1 then
        L2_1 = isnull
        L3_1 = L1_1.determination
        L2_1 = L2_1(L3_1)
        if not L2_1 then
          L2_1 = isnull
          L3_1 = L1_1.confidence
          L2_1 = L2_1(L3_1)
          if not L2_1 then
            goto lbl_39
          end
        end
      end
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      do return L2_1 end
      ::lbl_39::
      L2_1 = L1_1.ip
      if L2_1 ~= nil then
        L2_1 = L1_1.ip
        if L2_1 ~= "" then
          goto lbl_48
        end
      end
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      do return L2_1 end
      ::lbl_48::
      L2_1 = L1_1.determination
      if L2_1 == L0_1 then
        L2_1 = L1_1.confidence
        if not (L2_1 < 50) then
          goto lbl_57
        end
      end
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      do return L2_1 end
      ::lbl_57::
      L2_1 = nil
      L3_1 = nil
      L4_1 = false
      L5_1 = MpCommon
      L5_1 = L5_1.GetBehavioralNetworkBlocksSettings
      if L5_1 then
        L5_1 = pcall
        L6_1 = MpCommon
        L6_1 = L6_1.GetBehavioralNetworkBlocksSettings
        L7_1 = MpCommon
        L7_1 = L7_1.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION
        L5_1, L6_1 = L5_1(L6_1, L7_1)
        L3_1 = L6_1
        L2_1 = L5_1
        if L2_1 and L3_1 then
          L5_1 = isnull
          L6_1 = L3_1.Exclusions
          L5_1 = L5_1(L6_1)
          if not L5_1 then
            L5_1 = L3_1.Exclusions
            if L5_1 ~= "" then
              L5_1 = split
              L6_1 = L3_1.Exclusions
              L7_1 = "|"
              L5_1 = L5_1(L6_1, L7_1)
              L6_1 = convert_to_hashtable
              L7_1 = L5_1
              L6_1 = L6_1(L7_1)
              L5_1 = L6_1
              L6_1 = isIPInExclusionList
              L7_1 = L1_1.ip
              L8_1 = L5_1
              L9_1 = true
              L6_1 = L6_1(L7_1, L8_1, L9_1)
              L4_1 = L6_1
            end
          end
        end
      end
      if L4_1 == true then
        L5_1 = mp
        L5_1 = L5_1.CLEAN
        return L5_1
      end
      L5_1 = TrackAttackerServer
      L6_1 = L1_1.ip
      L5_1(L6_1)
      L5_1 = AddResearchData
      L6_1 = this_sigattrlog
      L6_1 = L6_1[1]
      L6_1 = L6_1.ppid
      L7_1 = true
      L5_1(L6_1, L7_1)
      L5_1 = mp
      L5_1 = L5_1.INFECTED
      return L5_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
