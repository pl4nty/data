local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L2_1 = ""
L3_1 = this_sigattrlog
L3_1 = L3_1[42]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[42]
  L1_1 = L3_1.ppid
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = this_sigattrlog
  L4_1 = L4_1[42]
  L4_1 = L4_1.utf8p1
  L5_1 = "/bash"
  L6_1 = 1
  L7_1 = true
  L3_1, L4_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  _ = L4_1
  L0_1 = L3_1
  if L0_1 ~= nil then
    L3_1 = sysio
    L3_1 = L3_1.IsFileExists
    L4_1 = "/run/yum.pid"
    L3_1 = L3_1(L4_1)
    if L3_1 then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
  end
  L3_1 = isParentPackageManager
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end
L3_1 = this_sigattrlog
L3_1 = L3_1[43]
L3_1 = L3_1.matched
if L3_1 then
  L2_1 = "T1546.004"
else
  L3_1 = this_sigattrlog
  L3_1 = L3_1[44]
  L3_1 = L3_1.matched
  if L3_1 then
    L2_1 = "T1543.002"
  else
    L3_1 = this_sigattrlog
    L3_1 = L3_1[45]
    L3_1 = L3_1.matched
    if L3_1 then
      L2_1 = "T1543"
    else
      L3_1 = this_sigattrlog
      L3_1 = L3_1[46]
      L3_1 = L3_1.matched
      if L3_1 then
        L2_1 = "T1546"
      else
        L3_1 = this_sigattrlog
        L3_1 = L3_1[47]
        L3_1 = L3_1.matched
        if L3_1 then
          L2_1 = "T1547.006"
        else
          L3_1 = this_sigattrlog
          L3_1 = L3_1[48]
          L3_1 = L3_1.matched
          if L3_1 then
            L2_1 = "T1037.004"
          else
            L3_1 = this_sigattrlog
            L3_1 = L3_1[49]
            L3_1 = L3_1.matched
            if L3_1 then
              L2_1 = "T1053.003"
            else
              L3_1 = mp
              L3_1 = L3_1.CLEAN
              return L3_1
            end
          end
        end
      end
    end
  end
end
if L1_1 ~= nil then
  L3_1 = TrackPidAndTechniqueBM
  L4_1 = L1_1
  L5_1 = L2_1
  L6_1 = "Persistence"
  L3_1(L4_1, L5_1, L6_1)
end
L3_1 = reportRelatedBmHits
L3_1()
L3_1 = addRelatedProcess
L3_1()
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
