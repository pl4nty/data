local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L1_1 = this_sigattrlog
L1_1 = L1_1[10]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[10]
  L0_1 = L1_1.utf8p1
  L2_1 = L0_1
  L1_1 = L0_1.match
  L3_1 = "([^\\]+)$"
  L1_1 = L1_1(L2_1, L3_1)
  if not L1_1 then
    L1_1 = ""
  end
  L3_1 = L1_1
  L2_1 = L1_1.match
  L4_1 = "^(.+)%.([^%.]+)$"
  L2_1, L3_1 = L2_1(L3_1, L4_1)
  if L3_1 then
    L4_1 = contains
    L5_1 = string
    L5_1 = L5_1.lower
    L6_1 = L3_1
    L5_1 = L5_1(L6_1)
    L6_1 = {}
    L7_1 = "exe"
    L8_1 = "dll"
    L6_1[1] = L7_1
    L6_1[2] = L8_1
    L4_1 = L4_1(L5_1, L6_1)
    if L4_1 then
      goto lbl_35
    end
  end
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
::lbl_35::
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = bm
L1_1 = L1_1.get_process_relationships
L1_1, L2_1 = L1_1()
if L1_1 then
  L3_1 = ipairs
  L4_1 = L1_1
  L3_1, L4_1, L5_1 = L3_1(L4_1)
  for L6_1, L7_1 in L3_1, L4_1, L5_1 do
    L8_1 = L7_1.reason
    L9_1 = bm
    L9_1 = L9_1.RELATIONSHIP_INJECTION
    if L8_1 == L9_1 then
      L8_1 = L7_1.image_path
      if L8_1 then
        L8_1 = contains
        L9_1 = L7_1.image_path
        L10_1 = "wbem\\WmiPrvSE.exe"
        L8_1 = L8_1(L9_1, L10_1)
        if L8_1 then
          L8_1 = bm
          L8_1 = L8_1.get_current_process_startup_info
          L8_1 = L8_1()
          if L8_1 then
            L9_1 = L8_1.ppid
            if L9_1 then
              L9_1 = mp
              L9_1 = L9_1.GetProcessCommandLine
              L10_1 = L8_1.ppid
              L9_1 = L9_1(L10_1)
              if not L9_1 then
                L9_1 = ""
              end
              L10_1 = contains
              L11_1 = L9_1
              L12_1 = "svchost.exe -k secsvcs"
              L10_1 = L10_1(L11_1, L12_1)
              if L10_1 then
                L10_1 = mp
                L10_1 = L10_1.CLEAN
                return L10_1
              end
            end
          end
        end
      end
      L8_1 = bm
      L8_1 = L8_1.add_related_string
      L9_1 = "InjectedBy"
      L10_1 = L7_1.image_path
      if not L10_1 then
        L10_1 = ""
      end
      L11_1 = bm
      L11_1 = L11_1.RelatedStringBMReport
      L8_1(L9_1, L10_1, L11_1)
      L8_1 = bm
      L8_1 = L8_1.add_related_string
      L9_1 = "File_Created"
      L10_1 = L0_1
      L11_1 = bm
      L11_1 = L11_1.RelatedStringBMReport
      L8_1(L9_1, L10_1, L11_1)
      L8_1 = mp
      L8_1 = L8_1.INFECTED
      return L8_1
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
