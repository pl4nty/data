local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L2_1 = {}
L3_1 = this_sigattrlog
L3_1 = L3_1[3]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[4]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = tostring
    L4_1 = this_sigattrlog
    L4_1 = L4_1[3]
    L4_1 = L4_1.utf8p2
    if not L4_1 then
      L4_1 = ""
    end
    L3_1 = L3_1(L4_1)
    L4_1 = tostring
    L5_1 = this_sigattrlog
    L5_1 = L5_1[4]
    L5_1 = L5_1.utf8p2
    if not L5_1 then
      L5_1 = ""
    end
    L4_1 = L4_1(L5_1)
    L6_1 = L3_1
    L5_1 = L3_1.gsub
    L7_1 = "[\128-\255]"
    L8_1 = ""
    L5_1 = L5_1(L6_1, L7_1, L8_1)
    L3_1 = L5_1
    L6_1 = L4_1
    L5_1 = L4_1.gsub
    L7_1 = "[\128-\255]"
    L8_1 = ""
    L5_1 = L5_1(L6_1, L7_1, L8_1)
    L4_1 = L5_1
    if L4_1 == "" then
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      return L5_1
    end
    L5_1 = string
    L5_1 = L5_1.find
    L6_1 = L3_1
    L7_1 = "{.-}"
    L8_1 = 1
    L9_1 = false
    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
    if L5_1 then
      L5_1 = string
      L5_1 = L5_1.find
      L6_1 = L4_1
      L7_1 = "{.-}"
      L8_1 = 1
      L9_1 = false
      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
      if L5_1 then
        goto lbl_64
      end
    end
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    do return L5_1 end
    ::lbl_64::
    if L3_1 ~= L4_1 then
      L0_1 = true
      L5_1 = "old_value_mismatch"
      L6_1 = "TreatAs"
      L1_1 = L5_1 .. L6_1
      L2_1.CLSID_From = L3_1
      L2_1.CLSID_To = L4_1
    else
      L5_1 = string
      L5_1 = L5_1.find
      L6_1 = this_sigattrlog
      L6_1 = L6_1[4]
      L6_1 = L6_1.utf8p1
      L7_1 = "HKCU\\"
      L8_1 = 1
      L9_1 = true
      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
      if L5_1 then
        L5_1 = string
        L5_1 = L5_1.gsub
        L6_1 = this_sigattrlog
        L6_1 = L6_1[4]
        L6_1 = L6_1.utf8p1
        L7_1 = "HKCU\\"
        L8_1 = "HKLM\\"
        L5_1 = L5_1(L6_1, L7_1, L8_1)
        L6_1 = GetRegistryValue
        L7_1 = L5_1
        L8_1 = ""
        L6_1 = L6_1(L7_1, L8_1)
        L8_1 = L6_1
        L7_1 = L6_1.gsub
        L9_1 = "[\128-\255]"
        L10_1 = ""
        L7_1 = L7_1(L8_1, L9_1, L10_1)
        L6_1 = L7_1
        L7_1 = string
        L7_1 = L7_1.find
        L8_1 = L3_1
        L9_1 = "{.-}"
        L10_1 = 1
        L11_1 = false
        L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
        if not L7_1 then
          L7_1 = mp
          L7_1 = L7_1.CLEAN
          return L7_1
        end
        if L6_1 then
          L7_1 = string
          L7_1 = L7_1.find
          L8_1 = L6_1
          L9_1 = "{.-}"
          L10_1 = 1
          L11_1 = false
          L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
          if L7_1 and L6_1 ~= L4_1 then
            L0_1 = true
            L7_1 = "hklm_hkcu_mismatch"
            L8_1 = "TreatAs"
            L1_1 = L7_1 .. L8_1
            L2_1.CLSID_From = L6_1
            L2_1.CLSID_To = L4_1
          end
        end
      end
    end
    if L0_1 then
      L5_1 = add_parents
      L5_1 = L5_1()
      L2_1.parents = L5_1
      L5_1 = bm
      L5_1 = L5_1.get_imagepath
      L5_1 = L5_1()
      L2_1.processname = L5_1
      L2_1.reason = L1_1
      L5_1 = string
      L5_1 = L5_1.match
      L6_1 = this_sigattrlog
      L6_1 = L6_1[4]
      L6_1 = L6_1.utf8p1
      L7_1 = "({.-})"
      L5_1 = L5_1(L6_1, L7_1)
      L2_1.appId = L5_1
      L5_1 = safeJsonSerialize
      L6_1 = L2_1
      L5_1 = L5_1(L6_1)
      if not L5_1 then
        L5_1 = L2_1.processname
        if not L5_1 then
          L5_1 = ""
        end
      end
      L6_1 = AppendToRollingQueue
      L7_1 = "Potential_COM_Hijacked_CLSIDs"
      L8_1 = string
      L8_1 = L8_1.lower
      L9_1 = L2_1.CLSID_To
      L8_1 = L8_1(L9_1)
      L9_1 = L5_1
      L10_1 = 1800
      L11_1 = 100
      L12_1 = 0
      L6_1(L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
      L6_1 = bm
      L6_1 = L6_1.add_related_string
      L7_1 = "AdditionalInfo"
      L8_1 = L5_1
      L9_1 = bm
      L9_1 = L9_1.RelatedStringBMReport
      L6_1(L7_1, L8_1, L9_1)
      L6_1 = mp
      L6_1 = L6_1.INFECTED
      return L6_1
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
