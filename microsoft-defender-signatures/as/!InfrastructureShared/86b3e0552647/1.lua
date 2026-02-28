local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L0_1 = L1_1.utf8p2
  end
end
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  L3_1 = L1_1
  L2_1 = L1_1.find
  L4_1 = "reg%.?e?x?e?%s+delete%s"
  L2_1 = L2_1(L3_1, L4_1)
  if not L2_1 then
    L3_1 = L1_1
    L2_1 = L1_1.find
    L4_1 = "reg%.?e?x?e?%s+add%s"
    L2_1 = L2_1(L3_1, L4_1)
    if not L2_1 then
      goto lbl_33
    end
  end
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  do return L2_1 end
  ::lbl_33::
  L3_1 = L1_1
  L2_1 = L1_1.find
  L4_1 = "powershell%.exe.*%sset-"
  L2_1 = L2_1(L3_1, L4_1)
  if not L2_1 then
    L3_1 = L1_1
    L2_1 = L1_1.find
    L4_1 = "passwordexpirywarning"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if not L2_1 then
      goto lbl_48
    end
  end
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
::lbl_48::
L1_1 = bm
L1_1 = L1_1.get_process_relationships
L1_1, L2_1 = L1_1()
L3_1 = ipairs
L4_1 = L1_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  L8_1 = L7_1.image_path
  if L8_1 ~= nil then
    L9_1 = string
    L9_1 = L9_1.lower
    L10_1 = L8_1
    L9_1 = L9_1(L10_1)
    L8_1 = L9_1
    L10_1 = L8_1
    L9_1 = L8_1.find
    L11_1 = "windows\\ccm\\"
    L12_1 = 1
    L13_1 = true
    L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
    if L9_1 then
      L9_1 = mp
      L9_1 = L9_1.CLEAN
      return L9_1
    end
    L10_1 = L8_1
    L9_1 = L8_1.find
    L11_1 = "tripwire.*\\twexec%.exe"
    L9_1 = L9_1(L10_1, L11_1)
    if L9_1 then
      L9_1 = mp
      L9_1 = L9_1.CLEAN
      return L9_1
    end
    L10_1 = L8_1
    L9_1 = L8_1.find
    L11_1 = "ruby%.exe"
    L12_1 = 1
    L13_1 = true
    L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
    if L9_1 then
      L9_1 = mp
      L9_1 = L9_1.CLEAN
      return L9_1
    end
    L10_1 = L8_1
    L9_1 = L8_1.find
    L11_1 = "verodin_backend%.exe"
    L12_1 = 1
    L13_1 = true
    L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
    if L9_1 then
      L9_1 = mp
      L9_1 = L9_1.CLEAN
      return L9_1
    end
  end
end
L3_1 = TrackPidAndTechniqueBM
L4_1 = "BM"
L5_1 = "T1003.005"
L6_1 = "creddiscovery"
L3_1(L4_1, L5_1, L6_1)
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
