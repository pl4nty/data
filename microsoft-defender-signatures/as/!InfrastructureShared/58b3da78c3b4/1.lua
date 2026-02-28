local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p2
    if L2_1 ~= nil then
      L2_1 = string
      L2_1 = L2_1.lower
      L3_1 = this_sigattrlog
      L3_1 = L3_1[1]
      L3_1 = L3_1.utf8p1
      L2_1 = L2_1(L3_1)
      L0_1 = L2_1
      L2_1 = string
      L2_1 = L2_1.lower
      L3_1 = this_sigattrlog
      L3_1 = L3_1[1]
      L3_1 = L3_1.utf8p2
      L2_1 = L2_1(L3_1)
      L1_1 = L2_1
      if L0_1 ~= L1_1 then
        L2_1 = StringEndsWith
        L3_1 = L1_1
        L4_1 = "\\certutil.exe"
        L2_1 = L2_1(L3_1, L4_1)
        if not L2_1 then
          L2_1 = sysio
          L2_1 = L2_1.IsFileExists
          L3_1 = L1_1
          L2_1 = L2_1(L3_1)
          if L2_1 then
            L2_1 = bm
            L2_1 = L2_1.add_threat_file
            L3_1 = L1_1
            L2_1(L3_1)
          end
          L2_1 = TrackPidAndTechniqueBM
          L3_1 = this_sigattrlog
          L3_1 = L3_1[1]
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
