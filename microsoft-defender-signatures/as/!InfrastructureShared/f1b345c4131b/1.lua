local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L4_1 = this_sigattrlog
L4_1 = L4_1[6]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[6]
  L4_1 = L4_1.utf8p2
  if L4_1 ~= nil then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[6]
    L4_1 = L4_1.utf8p2
    if L4_1 ~= "" then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[6]
      L4_1 = L4_1.utf8p1
      if L4_1 ~= nil then
        L4_1 = this_sigattrlog
        L4_1 = L4_1[6]
        L4_1 = L4_1.utf8p1
        if L4_1 ~= "" then
          goto lbl_29
        end
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_29::
L4_1 = this_sigattrlog
L4_1 = L4_1[5]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[5]
  L4_1 = L4_1.utf8p2
  if L4_1 ~= nil then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[5]
    L4_1 = L4_1.utf8p2
    if L4_1 ~= "" then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[5]
      L2_1 = L4_1.utf8p2
    end
  end
end
L4_1 = SuspMacPathsToMonitor
L5_1 = L2_1
L6_1 = true
L4_1 = L4_1(L5_1, L6_1)
if not L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = this_sigattrlog
L4_1 = L4_1[6]
L1_1 = L4_1.utf8p2
L4_1 = this_sigattrlog
L4_1 = L4_1[6]
L0_1 = L4_1.utf8p1
L4_1 = this_sigattrlog
L4_1 = L4_1[2]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[2]
  L4_1 = L4_1.utf8p2
  if L4_1 ~= nil then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[2]
    L4_1 = L4_1.utf8p2
    if L4_1 ~= "" then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[2]
      L3_1 = L4_1.utf8p2
  end
end
else
  L4_1 = this_sigattrlog
  L4_1 = L4_1[3]
  L4_1 = L4_1.matched
  if L4_1 then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[3]
    L4_1 = L4_1.utf8p2
    if L4_1 ~= nil then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[3]
      L4_1 = L4_1.utf8p2
      if L4_1 ~= "" then
        L4_1 = this_sigattrlog
        L4_1 = L4_1[3]
        L3_1 = L4_1.utf8p2
      end
    end
  end
end
if L2_1 ~= nil and L0_1 ~= nil and L1_1 ~= nil and L3_1 ~= nil then
  L5_1 = L2_1
  L4_1 = L2_1.match
  L6_1 = "[^/]*$"
  L4_1 = L4_1(L5_1, L6_1)
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L3_1
  L7_1 = L4_1
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if not L5_1 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  if L2_1 ~= L0_1 then
    L5_1 = string
    L5_1 = L5_1.find
    L6_1 = L1_1
    L7_1 = L4_1
    L8_1 = 1
    L9_1 = true
    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
    if not L5_1 then
      goto lbl_141
    end
  end
  L5_1 = bm
  L5_1 = L5_1.trigger_sig
  L6_1 = "CurlDownChmodExec"
  L7_1 = L2_1
  L5_1(L6_1, L7_1)
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
::lbl_141::
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
