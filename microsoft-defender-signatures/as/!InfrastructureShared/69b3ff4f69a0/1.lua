local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = this_sigattrlog
  L3_1 = L3_1[2]
  L3_1 = L3_1.utf8p1
  L2_1 = L2_1(L3_1)
  L0_1 = L2_1
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[3]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = this_sigattrlog
    L3_1 = L3_1[3]
    L3_1 = L3_1.utf8p1
    L2_1 = L2_1(L3_1)
    L0_1 = L2_1
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[4]
    L2_1 = L2_1.matched
    if L2_1 then
      L2_1 = string
      L2_1 = L2_1.lower
      L3_1 = this_sigattrlog
      L3_1 = L3_1[4]
      L3_1 = L3_1.utf8p1
      L2_1 = L2_1(L3_1)
      L0_1 = L2_1
    else
      L2_1 = this_sigattrlog
      L2_1 = L2_1[5]
      L2_1 = L2_1.matched
      if L2_1 then
        L2_1 = string
        L2_1 = L2_1.lower
        L3_1 = this_sigattrlog
        L3_1 = L3_1[5]
        L3_1 = L3_1.utf8p1
        L2_1 = L2_1(L3_1)
        L0_1 = L2_1
      end
    end
  end
end
if L0_1 then
  L2_1 = string
  L2_1 = L2_1.match
  L3_1 = L0_1
  L4_1 = "/([^/]+)$"
  L2_1 = L2_1(L3_1, L4_1)
  L1_1 = L2_1
  L2_1 = sysio
  L2_1 = L2_1.IsFileExists
  L3_1 = "/bin/"
  L4_1 = L1_1
  L3_1 = L3_1 .. L4_1
  L2_1 = L2_1(L3_1)
  if not L2_1 then
    L2_1 = sysio
    L2_1 = L2_1.IsFileExists
    L3_1 = "/sbin/"
    L4_1 = L1_1
    L3_1 = L3_1 .. L4_1
    L2_1 = L2_1(L3_1)
    if not L2_1 then
      L2_1 = sysio
      L2_1 = L2_1.IsFileExists
      L3_1 = "/usr/bin/"
      L4_1 = L1_1
      L3_1 = L3_1 .. L4_1
      L2_1 = L2_1(L3_1)
      if not L2_1 then
        L2_1 = sysio
        L2_1 = L2_1.IsFileExists
        L3_1 = "/usr/sbin/"
        L4_1 = L1_1
        L3_1 = L3_1 .. L4_1
        L2_1 = L2_1(L3_1)
        if not L2_1 then
          goto lbl_116
        end
      end
    end
  end
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L0_1
  L4_1 = "/bin/"
  L5_1 = L1_1
  L4_1 = L4_1 .. L5_1
  L5_1 = string
  L5_1 = L5_1.len
  L6_1 = L1_1
  L5_1 = L5_1(L6_1)
  L5_1 = 5 + L5_1
  L5_1 = -L5_1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 == nil then
    L2_1 = TrackPidAndTechniqueBM
    L3_1 = "BM"
    L4_1 = "T1036"
    L5_1 = "Masquerading"
    L2_1(L3_1, L4_1, L5_1)
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
::lbl_116::
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
