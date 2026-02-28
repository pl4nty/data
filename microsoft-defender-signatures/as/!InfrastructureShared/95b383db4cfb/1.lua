local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.wp1
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p1
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L1_1 = L1_1.wp1
    if L1_1 ~= nil then
      L1_1 = string
      L1_1 = L1_1.lower
      L2_1 = this_sigattrlog
      L2_1 = L2_1[2]
      L2_1 = L2_1.utf8p1
      L1_1 = L1_1(L2_1)
      L0_1 = L1_1
    end
  end
end
if L0_1 ~= nil then
  L2_1 = L0_1
  L1_1 = L0_1.match
  L3_1 = "^/.+/(.+)$"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.sub
    L3_1 = L1_1
    L4_1 = 1
    L5_1 = 1
    L2_1 = L2_1(L3_1, L4_1, L5_1)
    if L2_1 == "!" then
      L2_1 = string
      L2_1 = L2_1.sub
      L3_1 = L1_1
      L4_1 = -5
      L2_1 = L2_1(L3_1, L4_1)
      if L2_1 == "!.txt" then
        L3_1 = L1_1
        L2_1 = L1_1.len
        L2_1 = L2_1(L3_1)
        if 10 < L2_1 then
          L3_1 = L1_1
          L2_1 = L1_1.len
          L2_1 = L2_1(L3_1)
          if L2_1 < 25 then
            L2_1 = reportGenericRansomwareRQ
            L3_1 = "genf_linux_ransom_meta"
            L2_1 = L2_1(L3_1)
            L3_1 = mp
            L3_1 = L3_1.INFECTED
            if L2_1 == L3_1 then
              L2_1 = TrackPidAndTechniqueBM
              L3_1 = "BM"
              L4_1 = "T1486"
              L5_1 = "Impact_FileEncryption"
              L2_1(L3_1, L4_1, L5_1)
              L2_1 = bm
              L2_1 = L2_1.get_process_relationships
              L2_1, L3_1 = L2_1()
              L4_1 = ipairs
              L5_1 = L3_1
              L4_1, L5_1, L6_1 = L4_1(L5_1)
              for L7_1, L8_1 in L4_1, L5_1, L6_1 do
                L9_1 = bm
                L9_1 = L9_1.trigger_sig
                L10_1 = "BmTraverseTreeBlock"
                L11_1 = "Detected"
                L12_1 = L8_1.ppid
                L9_1(L10_1, L11_1, L12_1)
              end
              L4_1 = mp
              L4_1 = L4_1.INFECTED
              return L4_1
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
