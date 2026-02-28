local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L1_1 = ""
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p2
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p1
    L3_1 = L2_1
    L2_1 = L2_1.lower
    L2_1 = L2_1(L3_1)
    L3_1 = string
    L3_1 = L3_1.byte
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    L4_1 = string
    L4_1 = L4_1.byte
    L5_1 = "%"
    L4_1 = L4_1(L5_1)
    if L3_1 == L4_1 then
      L3_1 = string
      L3_1 = L3_1.match
      L4_1 = L2_1
      L5_1 = "%%common_appdata%%\\(.*)"
      L3_1 = L3_1(L4_1, L5_1)
      L2_1 = L3_1
    else
      L3_1 = string
      L3_1 = L3_1.match
      L4_1 = L2_1
      L5_1 = "^[%a]:\\[^\\]+\\(.*)"
      L3_1 = L3_1(L4_1, L5_1)
      L2_1 = L3_1
    end
    L4_1 = L2_1
    L3_1 = L2_1.find
    L5_1 = "\\"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if L3_1 == nil then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[4]
      L3_1 = L3_1.matched
      if L3_1 then
        L3_1 = this_sigattrlog
        L3_1 = L3_1[4]
        L3_1 = L3_1.utf8p1
        if L3_1 then
          L3_1 = this_sigattrlog
          L3_1 = L3_1[4]
          L3_1 = L3_1.utf8p2
          if L3_1 then
            L3_1 = this_sigattrlog
            L3_1 = L3_1[4]
            L1_1 = L3_1.utf8p1
            L3_1 = mp
            L0_1 = L3_1.INFECTED
        end
      end
      else
        L3_1 = this_sigattrlog
        L3_1 = L3_1[2]
        L3_1 = L3_1.matched
        if L3_1 then
          L3_1 = this_sigattrlog
          L3_1 = L3_1[2]
          L3_1 = L3_1.utf8p1
          if L3_1 then
            L3_1 = this_sigattrlog
            L3_1 = L3_1[2]
            L3_1 = L3_1.utf8p2
            if L3_1 then
              L3_1 = this_sigattrlog
              L3_1 = L3_1[2]
              L1_1 = L3_1.utf8p1
              L3_1 = mp
              L0_1 = L3_1.INFECTED
          end
        end
        else
          L3_1 = this_sigattrlog
          L3_1 = L3_1[3]
          L3_1 = L3_1.matched
          if L3_1 then
            L3_1 = this_sigattrlog
            L3_1 = L3_1[3]
            L3_1 = L3_1.utf8p1
            if L3_1 then
              L3_1 = this_sigattrlog
              L3_1 = L3_1[3]
              L3_1 = L3_1.utf8p2
              if L3_1 then
                L3_1 = this_sigattrlog
                L3_1 = L3_1[3]
                L1_1 = L3_1.utf8p1
                L3_1 = mp
                L0_1 = L3_1.INFECTED
              end
            end
          end
        end
      end
      L3_1 = mp
      L3_1 = L3_1.INFECTED
      if L0_1 == L3_1 then
        L3_1 = this_sigattrlog
        L3_1 = L3_1[1]
        L3_1 = L3_1.matched
        if L3_1 then
          L3_1 = this_sigattrlog
          L3_1 = L3_1[1]
          L3_1 = L3_1.utf8p2
          if L3_1 then
            L3_1 = {}
            L3_1.type = L1_1
            L4_1 = this_sigattrlog
            L4_1 = L4_1[1]
            L4_1 = L4_1.utf8p2
            L3_1.cmd = L4_1
            L4_1 = bm
            L4_1 = L4_1.add_related_string
            L5_1 = "ransom_meta"
            L6_1 = safeJsonSerialize
            L7_1 = L3_1
            L6_1 = L6_1(L7_1)
            L7_1 = bm
            L7_1 = L7_1.RelatedStringBMReport
            L4_1(L5_1, L6_1, L7_1)
            L4_1 = bm
            L4_1 = L4_1.trigger_sig
            L5_1 = "GenericRansomware:AAA"
            L6_1 = safeJsonSerialize
            L7_1 = L3_1
            L6_1, L7_1 = L6_1(L7_1)
            L4_1(L5_1, L6_1, L7_1)
            L4_1 = reportSessionInformation
            L4_1()
            L4_1 = mp
            L4_1 = L4_1.INFECTED
            return L4_1
          end
        end
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
