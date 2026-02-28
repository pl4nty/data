local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L2_1 = {}
L3_1 = this_sigattrlog
L3_1 = L3_1[1]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[2]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[1]
    L3_1 = L3_1.utf8p2
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = string
    L5_1 = L5_1.lower
    L6_1 = L3_1
    L5_1 = L5_1(L6_1)
    L6_1 = "http"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if not L4_1 then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    L4_1 = this_sigattrlog
    L4_1 = L4_1[1]
    L4_1 = L4_1.utf8p2
    L5_1 = this_sigattrlog
    L5_1 = L5_1[2]
    L5_1 = L5_1.utf8p2
    if L4_1 ~= L5_1 then
      L4_1 = UrlGrader
      L5_1 = this_sigattrlog
      L5_1 = L5_1[2]
      L5_1 = L5_1.utf8p2
      L6_1 = "Behavior:Win32/COMHijacking.D"
      L7_1 = false
      L4_1, L5_1 = L4_1(L5_1, L6_1, L7_1)
      if L4_1 ~= 0 then
        L2_1.URL_Grading_Info = L5_1
      end
      L0_1 = true
      L6_1 = "old_value_mismatch"
      L7_1 = "ScriptletUrl"
      L1_1 = L6_1 .. L7_1
      L6_1 = this_sigattrlog
      L6_1 = L6_1[1]
      L6_1 = L6_1.utf8p2
      L2_1.old_url = L6_1
      L6_1 = this_sigattrlog
      L6_1 = L6_1[2]
      L6_1 = L6_1.utf8p2
      L2_1.new_url = L6_1
    else
      L4_1 = string
      L4_1 = L4_1.find
      L5_1 = this_sigattrlog
      L5_1 = L5_1[2]
      L5_1 = L5_1.utf8p1
      L6_1 = "HKCU\\"
      L7_1 = 1
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if L4_1 then
        L4_1 = string
        L4_1 = L4_1.gsub
        L5_1 = this_sigattrlog
        L5_1 = L5_1[2]
        L5_1 = L5_1.utf8p1
        L6_1 = "HKCU\\"
        L7_1 = "HKLM\\"
        L4_1 = L4_1(L5_1, L6_1, L7_1)
        L5_1 = GetRegistryValue
        L6_1 = L4_1
        L7_1 = ""
        L5_1 = L5_1(L6_1, L7_1)
        if L5_1 then
          L6_1 = this_sigattrlog
          L6_1 = L6_1[2]
          L6_1 = L6_1.utf8p2
          if L5_1 ~= L6_1 then
            L0_1 = true
            L6_1 = "hklm_hkcu_mismatch"
            L7_1 = "ScriptletUrl"
            L1_1 = L6_1 .. L7_1
            L2_1.hklm_url = L5_1
            L6_1 = this_sigattrlog
            L6_1 = L6_1[2]
            L6_1 = L6_1.utf8p2
            L2_1.hkcu_url = L6_1
          end
        end
      end
    end
    if L0_1 then
      L4_1 = add_parents
      L4_1 = L4_1()
      L2_1.parents = L4_1
      L4_1 = bm
      L4_1 = L4_1.get_imagepath
      L4_1 = L4_1()
      L2_1.processname = L4_1
      L2_1.reason = L1_1
      L4_1 = string
      L4_1 = L4_1.match
      L5_1 = this_sigattrlog
      L5_1 = L5_1[2]
      L5_1 = L5_1.utf8p1
      L6_1 = "({.-})"
      L4_1 = L4_1(L5_1, L6_1)
      L2_1.appId = L4_1
      L4_1 = safeJsonSerialize
      L5_1 = L2_1
      L4_1 = L4_1(L5_1)
      if not L4_1 then
        L4_1 = L2_1.processname
        if not L4_1 then
          L4_1 = ""
        end
      end
      L5_1 = bm
      L5_1 = L5_1.add_related_string
      L6_1 = "AdditionalInfo"
      L7_1 = L4_1
      L8_1 = bm
      L8_1 = L8_1.RelatedStringBMReport
      L5_1(L6_1, L7_1, L8_1)
      L5_1 = mp
      L5_1 = L5_1.INFECTED
      return L5_1
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
