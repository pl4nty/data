local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "BM_LNK_FILE"
L0_1 = L0_1(L1_1)
if L0_1 == false then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "PACKED_WITH:[CMDEmbedded]"
  L0_1 = L0_1(L1_1)
  if L0_1 == false then
    L0_1 = mp
    L0_1 = L0_1.CLEAN
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FNAME
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_PATH
L2_1 = L2_1(L3_1, L4_1)
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L1_1(L2_1, L3_1)
L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
L2_1 = false
L4_1 = L1_1
L3_1 = L1_1.sub
L5_1 = -3
L3_1 = L3_1(L4_1, L5_1)
L4_1 = "tmf|emf|wmf|spl|off|bak|m4a|mp4|mp3|wav|bmp|kgx|idx|etl|log|ico|sdd|dat"
L6_1 = L4_1
L5_1 = L4_1.find
L7_1 = L3_1
L5_1 = L5_1(L6_1, L7_1)
if L5_1 then
  L2_1 = true
end
L6_1 = L0_1
L5_1 = L0_1.find
L7_1 = "\\office\\recent"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if not L5_1 then
  L6_1 = L0_1
  L5_1 = L0_1.find
  L7_1 = "\\windows\\recent"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if not L5_1 then
    L6_1 = L0_1
    L5_1 = L0_1.find
    L7_1 = "\\microsoft\\teams\\"
    L8_1 = 1
    L9_1 = true
    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
    if not L5_1 then
      L6_1 = L0_1
      L5_1 = L0_1.find
      L7_1 = "\\windows\\cryptoguard"
      L8_1 = 1
      L9_1 = true
      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
      if not L5_1 then
        L6_1 = L0_1
        L5_1 = L0_1.find
        L7_1 = "\\microsoft\\msip\\tokencache"
        L8_1 = 1
        L9_1 = true
        L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
        if not L5_1 then
          L6_1 = L0_1
          L5_1 = L0_1.find
          L7_1 = "\\carbonblack\\store"
          L8_1 = 1
          L9_1 = true
          L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
          if not L5_1 then
            L6_1 = L0_1
            L5_1 = L0_1.find
            L7_1 = "\\crowdstrike\\downloads"
            L8_1 = 1
            L9_1 = true
            L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
            if not L5_1 then
              L6_1 = L0_1
              L5_1 = L0_1.find
              L7_1 = "\\cyvera\\ransomware"
              L8_1 = 1
              L9_1 = true
              L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
              if not L5_1 then
                L6_1 = L0_1
                L5_1 = L0_1.find
                L7_1 = "\\outlook\\offline address books"
                L8_1 = 1
                L9_1 = true
                L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                if not L5_1 then
                  L6_1 = L0_1
                  L5_1 = L0_1.find
                  L7_1 = "\\slack\\service worker\\cachestorage"
                  L8_1 = 1
                  L9_1 = true
                  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                  if not L5_1 then
                    L6_1 = L0_1
                    L5_1 = L0_1.find
                    L7_1 = "\\systemcertificates\\my\\certificates\\"
                    L8_1 = 1
                    L9_1 = true
                    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                    if not L5_1 then
                      L6_1 = L0_1
                      L5_1 = L0_1.find
                      L7_1 = "\\temp\\photocache\\"
                      L8_1 = 1
                      L9_1 = true
                      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                      if not L5_1 then
                        goto lbl_127
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
end
L2_1 = true
::lbl_127::
if L2_1 then
  L5_1 = mp
  L5_1 = L5_1.set_mpattribute
  L6_1 = "Lua:LnkExclusions"
  L5_1(L6_1)
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
