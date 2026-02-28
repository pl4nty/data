local L0_1, L1_1, L2_1, L3_1, L4_1
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.utf8p1
  L1_1 = L1_1(L2_1)
  L0_1 = L1_1
end
if L0_1 then
  L1_1 = string
  L1_1 = L1_1.sub
  L2_1 = L0_1
  L3_1 = 0
  L4_1 = 5
  L1_1 = L1_1(L2_1, L3_1, L4_1)
  if L1_1 ~= "/bin/" then
    L1_1 = string
    L1_1 = L1_1.sub
    L2_1 = L0_1
    L3_1 = 0
    L4_1 = 6
    L1_1 = L1_1(L2_1, L3_1, L4_1)
    if L1_1 ~= "/sbin/" then
      L1_1 = string
      L1_1 = L1_1.sub
      L2_1 = L0_1
      L3_1 = 0
      L4_1 = 9
      L1_1 = L1_1(L2_1, L3_1, L4_1)
      if L1_1 ~= "/usr/bin/" then
        L1_1 = string
        L1_1 = L1_1.sub
        L2_1 = L0_1
        L3_1 = 0
        L4_1 = 10
        L1_1 = L1_1(L2_1, L3_1, L4_1)
        if L1_1 ~= "/usr/sbin/" then
          goto lbl_50
        end
      end
    end
  end
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
::lbl_50::
L1_1 = TrackPidAndTechniqueBM
L2_1 = "BM"
L3_1 = "T1003.008"
L4_1 = "CredentialAccess"
L1_1(L2_1, L3_1, L4_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
