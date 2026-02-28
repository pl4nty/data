local L0_1, L1_1, L2_1, L3_1, L4_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.wp2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L0_1 = L1_1.utf8p2
  end
end
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.wp2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L0_1 = L1_1.utf8p2
  end
end
L1_1 = string
L1_1 = L1_1.match
L2_1 = L0_1
L3_1 = "%d+%.%d+%.%d+%.%d+"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L1_1 = string
  L1_1 = L1_1.match
  L2_1 = L0_1
  L3_1 = "[%a%d]+%:"
  L1_1 = L1_1(L2_1, L3_1)
  if not L1_1 then
    L1_1 = string
    L1_1 = L1_1.match
    L2_1 = L0_1
    L3_1 = "%s-l[%s$]"
    L1_1 = L1_1(L2_1, L3_1)
    if not L1_1 then
      L1_1 = string
      L1_1 = L1_1.match
      L2_1 = L0_1
      L3_1 = "%s%-%-listen[%s$]"
      L1_1 = L1_1(L2_1, L3_1)
      if not L1_1 then
        goto lbl_91
      end
    end
  end
end
L1_1 = string
L1_1 = L1_1.match
L2_1 = L0_1
L3_1 = "/bin/%a*sh"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = string
  L1_1 = L1_1.match
  L2_1 = L0_1
  L3_1 = "%s%-[ec]%s"
  L1_1 = L1_1(L2_1, L3_1)
  if not L1_1 then
    L1_1 = string
    L1_1 = L1_1.match
    L2_1 = L0_1
    L3_1 = "%s%-%-exec%s"
    L1_1 = L1_1(L2_1, L3_1)
    if not L1_1 then
      L1_1 = string
      L1_1 = L1_1.match
      L2_1 = L0_1
      L3_1 = "%s%-%-sh%-exec%s"
      L1_1 = L1_1(L2_1, L3_1)
      if not L1_1 then
        goto lbl_91
      end
    end
  end
  L1_1 = TrackPidAndTechniqueBM
  L2_1 = "BM"
  L3_1 = "T1059"
  L4_1 = "Execution_ReShell"
  L1_1(L2_1, L3_1, L4_1)
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
::lbl_91::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
