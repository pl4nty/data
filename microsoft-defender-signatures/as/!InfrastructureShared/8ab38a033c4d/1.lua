local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L0_1 = L2_1.utf8p2
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L1_1 = L2_1.ppid
  end
end
if L0_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L0_1
  L2_1 = L2_1(L3_1)
  L4_1 = L2_1
  L3_1 = L2_1.find
  L5_1 = "reg%.?e?x?e?%p?%s+delete%s"
  L3_1 = L3_1(L4_1, L5_1)
  if not L3_1 then
    L4_1 = L2_1
    L3_1 = L2_1.find
    L5_1 = "reg%.?e?x?e?%p?%s+add%s"
    L3_1 = L3_1(L4_1, L5_1)
    if not L3_1 then
      goto lbl_36
    end
  end
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  do return L3_1 end
  ::lbl_36::
  L4_1 = L2_1
  L3_1 = L2_1.find
  L5_1 = "powershell%.exe.*%sset-"
  L3_1 = L3_1(L4_1, L5_1)
  if not L3_1 then
    L4_1 = L2_1
    L3_1 = L2_1.find
    L5_1 = "passwordexpirywarning"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if not L3_1 then
      goto lbl_51
    end
  end
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
::lbl_51::
L2_1 = bm
L2_1 = L2_1.get_process_relationships
L2_1, L3_1 = L2_1()
L4_1 = ipairs
L5_1 = L2_1
L4_1, L5_1, L6_1 = L4_1(L5_1)
for L7_1, L8_1 in L4_1, L5_1, L6_1 do
  L9_1 = L8_1.image_path
  if L9_1 ~= nil then
    L10_1 = string
    L10_1 = L10_1.lower
    L11_1 = L9_1
    L10_1 = L10_1(L11_1)
    L9_1 = L10_1
    L11_1 = L9_1
    L10_1 = L9_1.find
    L12_1 = "windows\\ccm\\"
    L13_1 = 1
    L14_1 = true
    L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
    if L10_1 then
      L10_1 = mp
      L10_1 = L10_1.CLEAN
      return L10_1
    end
    L11_1 = L9_1
    L10_1 = L9_1.find
    L12_1 = "tripwire.*\\twexec%.exe"
    L10_1 = L10_1(L11_1, L12_1)
    if L10_1 then
      L10_1 = mp
      L10_1 = L10_1.CLEAN
      return L10_1
    end
    L11_1 = L9_1
    L10_1 = L9_1.find
    L12_1 = "ruby%.exe"
    L13_1 = 1
    L14_1 = true
    L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
    if L10_1 then
      L10_1 = mp
      L10_1 = L10_1.CLEAN
      return L10_1
    end
    L11_1 = L9_1
    L10_1 = L9_1.find
    L12_1 = "verodin_backend%.exe"
    L13_1 = 1
    L14_1 = true
    L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
    if L10_1 then
      L10_1 = mp
      L10_1 = L10_1.CLEAN
      return L10_1
    end
  end
end
L4_1 = IsDetectionThresholdMet
L5_1 = L1_1
L4_1 = L4_1(L5_1)
if L4_1 then
  L4_1 = TrackPidAndTechniqueBM
  L5_1 = L1_1
  L6_1 = "T1003.005"
  L7_1 = "credentialdumping"
  L4_1(L5_1, L6_1, L7_1)
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
