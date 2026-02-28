local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1 = L2_1()
L0_1 = L2_1
L2_1 = this_sigattrlog
L2_1 = L2_1[7]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[7]
  L1_1 = L2_1.utf8p2
end
if L0_1 then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L0_1
  L2_1 = L2_1(L3_1)
  L0_1 = L2_1
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L0_1
  L4_1 = "\\services.exe"
  L5_1 = -13
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L0_1
    L4_1 = "\\windows\\system32\\"
    L5_1 = -30
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if not L2_1 then
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L0_1
      L4_1 = "\\windows\\winsxs\\"
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if not L2_1 then
        goto lbl_50
      end
    end
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  ::lbl_50::
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L0_1
  L4_1 = "\\reg.exe"
  L5_1 = -8
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if not L2_1 then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L0_1
    L4_1 = "\\regedit.exe"
    L5_1 = -12
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if not L2_1 then
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L0_1
      L4_1 = "\\powershell.exe"
      L5_1 = -15
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if not L2_1 then
        L2_1 = string
        L2_1 = L2_1.find
        L3_1 = L0_1
        L4_1 = "\\cmd.exe"
        L5_1 = -8
        L6_1 = true
        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
        if not L2_1 then
          goto lbl_111
        end
      end
    end
  end
  L2_1 = bm
  L2_1 = L2_1.get_process_relationships
  L2_1, L3_1 = L2_1()
  if L2_1 then
    L4_1 = ipairs
    L5_1 = L2_1
    L4_1, L5_1, L6_1 = L4_1(L5_1)
    for L7_1, L8_1 in L4_1, L5_1, L6_1 do
      L9_1 = L8_1.ppid
      if L9_1 then
        L9_1 = mp
        L9_1 = L9_1.bitand
        L10_1 = L8_1.reason_ex
        L11_1 = 1
        L9_1 = L9_1(L10_1, L11_1)
        if L9_1 == 1 then
          L9_1 = bm
          L9_1 = L9_1.add_related_process
          L10_1 = L8_1.ppid
          L9_1(L10_1)
        end
      end
    end
  end
end
::lbl_111::
if L1_1 then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = "\\programdata\\microsoft\\windows defender\\definition updates\\{%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x}\\mpksldrv%.sys"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
