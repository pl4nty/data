local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L2_1 = {}
L3_1 = this_sigattrlog
L3_1 = L3_1[1]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[2]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = this_sigattrlog
    L4_1 = L4_1[1]
    L4_1 = L4_1.utf8p2
    L5_1 = "{.-}"
    L6_1 = 1
    L7_1 = false
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if L3_1 then
      L3_1 = tostring
      L4_1 = this_sigattrlog
      L4_1 = L4_1[1]
      L4_1 = L4_1.utf8p2
      L3_1 = L3_1(L4_1)
      L4_1 = tostring
      L5_1 = this_sigattrlog
      L5_1 = L5_1[2]
      L5_1 = L5_1.utf8p2
      L4_1 = L4_1(L5_1)
      if L3_1 ~= L4_1 then
        L0_1 = true
        L3_1 = "old_value_mismatch"
        L4_1 = "TypeLib"
        L1_1 = L3_1 .. L4_1
        L3_1 = this_sigattrlog
        L3_1 = L3_1[1]
        L3_1 = L3_1.utf8p2
        L2_1.CLSID_From = L3_1
        L3_1 = this_sigattrlog
        L3_1 = L3_1[2]
        L3_1 = L3_1.utf8p2
        L2_1.CLSID_To = L3_1
    end
    else
      L3_1 = string
      L3_1 = L3_1.find
      L4_1 = this_sigattrlog
      L4_1 = L4_1[2]
      L4_1 = L4_1.utf8p1
      L5_1 = "HKCU\\"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if L3_1 then
        L3_1 = string
        L3_1 = L3_1.gsub
        L4_1 = this_sigattrlog
        L4_1 = L4_1[2]
        L4_1 = L4_1.utf8p1
        L5_1 = "HKCU\\"
        L6_1 = "HKLM\\"
        L3_1 = L3_1(L4_1, L5_1, L6_1)
        L4_1 = GetRegistryValue
        L5_1 = L3_1
        L6_1 = ""
        L4_1 = L4_1(L5_1, L6_1)
        if L4_1 then
          L5_1 = tostring
          L6_1 = this_sigattrlog
          L6_1 = L6_1[2]
          L6_1 = L6_1.utf8p2
          L5_1 = L5_1(L6_1)
          if L4_1 ~= L5_1 then
            L0_1 = true
            L5_1 = "hklm_hkcu_mismatch"
            L6_1 = "TypeLib"
            L1_1 = L5_1 .. L6_1
            L2_1.CLSID_From = L4_1
            L5_1 = this_sigattrlog
            L5_1 = L5_1[2]
            L5_1 = L5_1.utf8p2
            L2_1.CLSID_To = L5_1
          end
        end
      end
    end
    if L0_1 then
      L3_1 = add_parents
      L3_1 = L3_1()
      L2_1.parents = L3_1
      L3_1 = bm
      L3_1 = L3_1.get_imagepath
      L3_1 = L3_1()
      L2_1.processname = L3_1
      L2_1.reason = L1_1
      L3_1 = string
      L3_1 = L3_1.match
      L4_1 = this_sigattrlog
      L4_1 = L4_1[2]
      L4_1 = L4_1.utf8p1
      L5_1 = "({.-})"
      L3_1 = L3_1(L4_1, L5_1)
      L2_1.appId = L3_1
      L3_1 = safeJsonSerialize
      L4_1 = L2_1
      L3_1 = L3_1(L4_1)
      if not L3_1 then
        L3_1 = L2_1.processname
        if not L3_1 then
          L3_1 = ""
        end
      end
      L4_1 = AppendToRollingQueue
      L5_1 = "Potential_COM_Hijacked_CLSIDs"
      L6_1 = string
      L6_1 = L6_1.lower
      L7_1 = L2_1.CLSID_To
      L6_1 = L6_1(L7_1)
      L7_1 = L3_1
      L8_1 = 1800
      L9_1 = 100
      L10_1 = 0
      L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
      L4_1 = bm
      L4_1 = L4_1.add_related_string
      L5_1 = "AdditionalInfo"
      L6_1 = L3_1
      L7_1 = bm
      L7_1 = L7_1.RelatedStringBMReport
      L4_1(L5_1, L6_1, L7_1)
      L4_1 = mp
      L4_1 = L4_1.INFECTED
      return L4_1
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
