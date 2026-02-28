local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L2_1 = this_sigattrlog
L2_1 = L2_1[4]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[4]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[4]
    L2_1 = L2_1.utf8p2
    if L2_1 ~= nil then
      L2_1 = string
      L2_1 = L2_1.lower
      L3_1 = this_sigattrlog
      L3_1 = L3_1[4]
      L3_1 = L3_1.utf8p1
      L2_1 = L2_1(L3_1)
      L0_1 = L2_1
      L2_1 = string
      L2_1 = L2_1.lower
      L3_1 = this_sigattrlog
      L3_1 = L3_1[4]
      L3_1 = L3_1.utf8p2
      L2_1 = L2_1(L3_1)
      L1_1 = L2_1
      L3_1 = L0_1
      L2_1 = L0_1.match
      L4_1 = "\\harddiskvolumeshadowcopy.+\\certutil.exe$"
      L2_1 = L2_1(L3_1, L4_1)
      if L2_1 then
        L2_1 = mp
        L2_1 = L2_1.CLEAN
        return L2_1
      end
      L3_1 = L0_1
      L2_1 = L0_1.match
      L4_1 = "\\filehistory\\"
      L2_1 = L2_1(L3_1, L4_1)
      if L2_1 then
        L2_1 = mp
        L2_1 = L2_1.CLEAN
        return L2_1
      end
      L3_1 = L1_1
      L2_1 = L1_1.match
      L4_1 = "programdata\\dell"
      L2_1 = L2_1(L3_1, L4_1)
      if L2_1 then
        L2_1 = mp
        L2_1 = L2_1.CLEAN
        return L2_1
      end
      if L0_1 ~= L1_1 then
        L2_1 = StringEndsWith
        L3_1 = L1_1
        L4_1 = "\\certutil.exe"
        L2_1 = L2_1(L3_1, L4_1)
        if not L2_1 then
          L2_1 = TrackPidAndTechniqueBM
          L3_1 = this_sigattrlog
          L3_1 = L3_1[4]
          L3_1 = L3_1.ppid
          L4_1 = "T1036"
          L5_1 = "masq_certutil"
          L2_1(L3_1, L4_1, L5_1)
          L2_1 = mp
          L2_1 = L2_1.INFECTED
          return L2_1
        end
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
