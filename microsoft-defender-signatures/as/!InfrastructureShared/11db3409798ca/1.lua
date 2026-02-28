local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = ""
L1_1 = ""
L2_1 = ""
L3_1 = ""
L4_1 = ""
L5_1 = nil
L6_1 = this_sigattrlog
L6_1 = L6_1[4]
L6_1 = L6_1.matched
if L6_1 then
  L6_1 = this_sigattrlog
  L6_1 = L6_1[4]
  L6_1 = L6_1.utf8p2
  if L6_1 ~= nil then
    L6_1 = this_sigattrlog
    L6_1 = L6_1[1]
    L6_1 = L6_1.matched
    if L6_1 then
      L6_1 = this_sigattrlog
      L6_1 = L6_1[1]
      L6_1 = L6_1.utf8p2
      if L6_1 ~= nil then
        L6_1 = this_sigattrlog
        L6_1 = L6_1[2]
        L6_1 = L6_1.matched
        if L6_1 then
          L6_1 = this_sigattrlog
          L6_1 = L6_1[2]
          L6_1 = L6_1.utf8p2
          if L6_1 ~= nil then
            L6_1 = this_sigattrlog
            L6_1 = L6_1[4]
            L2_1 = L6_1.utf8p2
            L7_1 = L2_1
            L6_1 = L2_1.match
            L8_1 = "^(.-)\\\\"
            L6_1 = L6_1(L7_1, L8_1)
            L1_1 = L6_1
            L6_1 = this_sigattrlog
            L6_1 = L6_1[1]
            L3_1 = L6_1.utf8p2
            L6_1 = this_sigattrlog
            L6_1 = L6_1[2]
            L4_1 = L6_1.utf8p2
            if L1_1 == nil then
              L6_1 = mp
              L6_1 = L6_1.CLEAN
              return L6_1
            end
            L6_1 = sysio
            L6_1 = L6_1.RegOpenKey
            L7_1 = L1_1
            L6_1 = L6_1(L7_1)
            L5_1 = L6_1
            if L5_1 then
              L6_1 = sysio
              L6_1 = L6_1.GetRegValueAsBinary
              L7_1 = L5_1
              L8_1 = "d"
              L6_1 = L6_1(L7_1, L8_1)
              L0_1 = L6_1
            end
            if not L0_1 then
              L6_1 = mp
              L6_1 = L6_1.CLEAN
              return L6_1
            end
            L6_1 = MpCommon
            L6_1 = L6_1.BinaryRegExpSearch
            L7_1 = "MZ"
            L8_1 = L0_1
            L6_1 = L6_1(L7_1, L8_1)
            if L6_1 then
              L7_1 = MpCommon
              L7_1 = L7_1.BinaryRegExpSearch
              L8_1 = "This program cannot be run in DOS mode"
              L9_1 = L0_1
              L7_1 = L7_1(L8_1, L9_1)
              if L7_1 then
                L8_1 = {}
                L9_1 = #L0_1
                L8_1.regbin_size = L9_1
                L8_1.regPath = L2_1
                L8_1.regKey = L1_1
                L9_1 = bm
                L9_1 = L9_1.set_detection_string
                L10_1 = safeJsonSerialize
                L11_1 = L8_1
                L10_1, L11_1, L12_1 = L10_1(L11_1)
                L9_1(L10_1, L11_1, L12_1)
                L9_1 = string
                L9_1 = L9_1.find
                L10_1 = string
                L10_1 = L10_1.lower
                L11_1 = L3_1
                L10_1 = L10_1(L11_1)
                L11_1 = string
                L11_1 = L11_1.lower
                L12_1 = L4_1
                L11_1, L12_1 = L11_1(L12_1)
                L9_1 = L9_1(L10_1, L11_1, L12_1)
                if L9_1 then
                  L9_1 = sysio
                  L9_1 = L9_1.IsFileExists
                  L10_1 = L4_1
                  L9_1 = L9_1(L10_1)
                  if L9_1 then
                    L9_1 = bm
                    L9_1 = L9_1.add_threat_file
                    L10_1 = L4_1
                    L9_1(L10_1)
                  end
                end
                L9_1 = mp
                L9_1 = L9_1.INFECTED
                return L9_1
              end
            end
          end
        end
      end
    end
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
