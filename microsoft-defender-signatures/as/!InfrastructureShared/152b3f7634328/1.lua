local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L2_1 = this_sigattrlog
L2_1 = L2_1[4]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[4]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[4]
    L0_1 = L2_1.utf8p2
end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[5]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[5]
    L2_1 = L2_1.utf8p2
    if L2_1 ~= nil then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[5]
      L0_1 = L2_1.utf8p2
  end
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[6]
    L2_1 = L2_1.matched
    if L2_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[6]
      L2_1 = L2_1.utf8p2
      if L2_1 ~= nil then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[6]
        L0_1 = L2_1.utf8p2
      end
    end
  end
end
L2_1 = contains
L3_1 = L0_1
L4_1 = {}
L5_1 = "rundll32"
L6_1 = "regsvr32"
L4_1[1] = L5_1
L4_1[2] = L6_1
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L3_1 = L0_1
  L2_1 = L0_1.lower
  L2_1 = L2_1(L3_1)
  L0_1 = L2_1
else
  L2_1 = contains
  L3_1 = L0_1
  L4_1 = "%-[eE][ncodemaNCODEMA]*%s+"
  L5_1 = false
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  if L2_1 then
    L2_1 = NormalizeCmdline
    L3_1 = "powershell"
    L4_1 = L0_1
    L2_1 = L2_1(L3_1, L4_1)
    L1_1 = L2_1
    L2_1 = contains
    L3_1 = L1_1
    L4_1 = {}
    L5_1 = "rundll32"
    L6_1 = "regsvr32"
    L4_1[1] = L5_1
    L4_1[2] = L6_1
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 then
      L3_1 = L1_1
      L2_1 = L1_1.lower
      L2_1 = L2_1(L3_1)
      L0_1 = L2_1
    end
  else
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
end
L2_1 = contains
L3_1 = L0_1
L4_1 = "http"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = contains
  L3_1 = L0_1
  L4_1 = "invoke-webRequest"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 then
    L2_1 = contains
    L3_1 = L0_1
    L4_1 = "start-process"
    L2_1 = L2_1(L3_1, L4_1)
    if not L2_1 then
      L2_1 = contains
      L3_1 = L0_1
      L4_1 = "get%-item.*%).length%s+%-ge%s+"
      L5_1 = false
      L2_1 = L2_1(L3_1, L4_1, L5_1)
      if not L2_1 then
        goto lbl_111
      end
    end
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
::lbl_111::
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
