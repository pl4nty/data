local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = isnull
  L2_1 = L0_1.ppid
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    goto lbl_17
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_17::
L1_1 = nil
L2_1 = nil
L3_1 = this_sigattrlog
L3_1 = L3_1[1]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = isnull
  L4_1 = this_sigattrlog
  L4_1 = L4_1[1]
  L4_1 = L4_1.utf8p1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    L3_1 = isnull
    L4_1 = this_sigattrlog
    L4_1 = L4_1[1]
    L4_1 = L4_1.utf8p2
    L3_1 = L3_1(L4_1)
    if not L3_1 then
      L3_1 = string
      L3_1 = L3_1.lower
      L4_1 = this_sigattrlog
      L4_1 = L4_1[1]
      L4_1 = L4_1.utf8p1
      L3_1 = L3_1(L4_1)
      L4_1 = this_sigattrlog
      L4_1 = L4_1[1]
      L2_1 = L4_1.utf8p2
      L1_1 = L3_1
  end
end
else
  L3_1 = this_sigattrlog
  L3_1 = L3_1[2]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = isnull
    L4_1 = this_sigattrlog
    L4_1 = L4_1[2]
    L4_1 = L4_1.utf8p1
    L3_1 = L3_1(L4_1)
    if not L3_1 then
      L3_1 = isnull
      L4_1 = this_sigattrlog
      L4_1 = L4_1[2]
      L4_1 = L4_1.utf8p2
      L3_1 = L3_1(L4_1)
      if not L3_1 then
        L3_1 = string
        L3_1 = L3_1.lower
        L4_1 = this_sigattrlog
        L4_1 = L4_1[2]
        L4_1 = L4_1.utf8p1
        L3_1 = L3_1(L4_1)
        L4_1 = this_sigattrlog
        L4_1 = L4_1[2]
        L2_1 = L4_1.utf8p2
        L1_1 = L3_1
    end
  end
  else
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end
L3_1 = string
L3_1 = L3_1.match
L4_1 = L2_1
L5_1 = "://([^/]+%.[^/]+)"
L3_1 = L3_1(L4_1, L5_1)
L4_1 = isnull
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if not L4_1 then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L3_1
  L6_1 = "^127%.%d+%.%d+%.%d+$"
  L4_1 = L4_1(L5_1, L6_1)
  if not L4_1 then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L3_1
    L6_1 = "^fe80::"
    L4_1 = L4_1(L5_1, L6_1)
    if not L4_1 and L3_1 ~= "r.office.microsoft.com" then
      goto lbl_110
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_110::
L4_1 = string
L4_1 = L4_1.match
L5_1 = L1_1
L6_1 = "outlook\\+(.-)\\+url"
L4_1 = L4_1(L5_1, L6_1)
L5_1 = isnull
L6_1 = L4_1
L5_1 = L5_1(L6_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = TrackPidAndTechniqueBM
L6_1 = L0_1.ppid
L7_1 = "T1137.004"
L8_1 = string
L8_1 = L8_1.format
L9_1 = "tamper_%s"
L10_1 = string
L10_1 = L10_1.gsub
L11_1 = string
L11_1 = L11_1.gsub
L12_1 = L4_1
L13_1 = "\\"
L14_1 = "_"
L11_1 = L11_1(L12_1, L13_1, L14_1)
L12_1 = " "
L13_1 = ""
L10_1, L11_1, L12_1, L13_1, L14_1 = L10_1(L11_1, L12_1, L13_1)
L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L8_1(L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
L5_1(L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
