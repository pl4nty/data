local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L2_1 = this_sigattrlog
L2_1 = L2_1[3]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[3]
  L2_1 = L2_1.wp2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[3]
    L1_1 = L2_1.ppid
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = this_sigattrlog
    L3_1 = L3_1[3]
    L3_1 = L3_1.utf8p2
    L2_1 = L2_1(L3_1)
    L0_1 = L2_1
end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[4]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[4]
    L2_1 = L2_1.wp2
    if L2_1 ~= nil then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[4]
      L1_1 = L2_1.ppid
      L2_1 = string
      L2_1 = L2_1.lower
      L3_1 = this_sigattrlog
      L3_1 = L3_1[4]
      L3_1 = L3_1.utf8p2
      L2_1 = L2_1(L3_1)
      L0_1 = L2_1
  end
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[5]
    L2_1 = L2_1.matched
    if L2_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[5]
      L2_1 = L2_1.wp2
      if L2_1 ~= nil then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[5]
        L1_1 = L2_1.ppid
        L2_1 = string
        L2_1 = L2_1.lower
        L3_1 = this_sigattrlog
        L3_1 = L3_1[5]
        L3_1 = L3_1.utf8p2
        L2_1 = L2_1(L3_1)
        L0_1 = L2_1
    end
    else
      L2_1 = this_sigattrlog
      L2_1 = L2_1[6]
      L2_1 = L2_1.matched
      if L2_1 then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[6]
        L2_1 = L2_1.wp2
        if L2_1 ~= nil then
          L2_1 = this_sigattrlog
          L2_1 = L2_1[6]
          L1_1 = L2_1.ppid
          L2_1 = string
          L2_1 = L2_1.lower
          L3_1 = this_sigattrlog
          L3_1 = L3_1[6]
          L3_1 = L3_1.utf8p2
          L2_1 = L2_1(L3_1)
          L0_1 = L2_1
      end
      else
        L2_1 = this_sigattrlog
        L2_1 = L2_1[7]
        L2_1 = L2_1.matched
        if L2_1 then
          L2_1 = this_sigattrlog
          L2_1 = L2_1[7]
          L2_1 = L2_1.wp2
          if L2_1 ~= nil then
            L2_1 = this_sigattrlog
            L2_1 = L2_1[7]
            L1_1 = L2_1.ppid
            L2_1 = string
            L2_1 = L2_1.lower
            L3_1 = this_sigattrlog
            L3_1 = L3_1[7]
            L3_1 = L3_1.utf8p2
            L2_1 = L2_1(L3_1)
            L0_1 = L2_1
          end
        end
      end
    end
  end
end
if L0_1 == nil or L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = this_sigattrlog
L2_1 = L2_1[7]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L0_1
  L4_1 = "init 0"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if not L2_1 then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L0_1
    L4_1 = "init 6"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if not L2_1 then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
  end
end
L2_1 = IsTechniqueObservedForPid
L3_1 = L1_1
L4_1 = "T1561.001"
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L2_1 = IsTechniqueObservedForPid
  L3_1 = L1_1
  L4_1 = "T1561.002"
  L2_1 = L2_1(L3_1, L4_1)
  if not L2_1 then
    goto lbl_160
  end
end
L2_1 = TrackPidAndTechniqueBM
L3_1 = L1_1
L4_1 = "T1529"
L5_1 = "Impact_SystemReboot"
L2_1(L3_1, L4_1, L5_1)
L2_1 = addRelatedProcess
L2_1()
L2_1 = mp
L2_1 = L2_1.INFECTED
do return L2_1 end
::lbl_160::
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
