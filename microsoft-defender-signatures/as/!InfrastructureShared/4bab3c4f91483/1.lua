local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L1_1 = this_sigattrlog
L1_1 = L1_1[4]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[4]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[4]
    L1_1 = L1_1.utf8p1
    if L1_1 ~= "" then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[4]
      L0_1 = L1_1.utf8p1
  end
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[5]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[5]
    L1_1 = L1_1.utf8p1
    if L1_1 ~= nil then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[5]
      L1_1 = L1_1.utf8p1
      if L1_1 ~= "" then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[5]
        L0_1 = L1_1.utf8p1
    end
  end
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[8]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[8]
      L1_1 = L1_1.utf8p1
      if L1_1 ~= nil then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[8]
        L1_1 = L1_1.utf8p1
        if L1_1 ~= "" then
          L1_1 = this_sigattrlog
          L1_1 = L1_1[8]
          L0_1 = L1_1.utf8p1
      end
    end
    else
      L1_1 = this_sigattrlog
      L1_1 = L1_1[9]
      L1_1 = L1_1.matched
      if L1_1 then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[9]
        L1_1 = L1_1.utf8p1
        if L1_1 ~= nil then
          L1_1 = this_sigattrlog
          L1_1 = L1_1[9]
          L1_1 = L1_1.utf8p1
          if L1_1 ~= "" then
            L1_1 = this_sigattrlog
            L1_1 = L1_1[9]
            L0_1 = L1_1.utf8p1
          end
        end
      end
    end
  end
end
if L0_1 ~= nil then
  L1_1 = sysio
  L1_1 = L1_1.IsFileExists
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L1_1 = bm
    L1_1 = L1_1.add_threat_file
    L2_1 = L0_1
    L1_1(L2_1)
  end
end
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1 = L1_1()
L2_1 = SuspMacPathsToMonitor
L3_1 = L1_1
L4_1 = true
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = "/Users/[^/]+/Downloads/"
  L5_1 = 1
  L6_1 = false
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if not L2_1 then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L1_1
    L4_1 = "/Users/[^/]+/Documents/"
    L5_1 = 1
    L6_1 = false
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if not L2_1 then
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L1_1
      L4_1 = "/Users/[^/]+/Desktop/"
      L5_1 = 1
      L6_1 = false
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if not L2_1 then
        goto lbl_134
      end
    end
  end
end
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
::lbl_134::
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
