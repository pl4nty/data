local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = bm
L0_1 = L0_1.DisableSignature
L0_1()
L0_1 = nil
L1_1 = nil
L2_1 = this_sigattrlog
L2_1 = L2_1[9]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[9]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[9]
    L0_1 = L2_1.utf8p2
end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[10]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[10]
    L2_1 = L2_1.utf8p2
    if L2_1 ~= nil then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[10]
      L0_1 = L2_1.utf8p2
    end
  end
end
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
  L4_1 = "downloadstring"
  L2_1 = L2_1(L3_1, L4_1)
  if not L2_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L0_1 = L1_1
end
L2_1 = isIEXfound
L3_1 = L0_1
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = {}
L3_1 = "raw.githubusercontent.com"
L2_1[1] = L3_1
L3_1 = contains
L4_1 = L0_1
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = IsSuspPSModule
  L4_1 = L0_1
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L3_1 = bm
    L3_1 = L3_1.add_related_string
    L4_1 = "PSPublicStager_c_cmdline"
    L5_1 = L0_1
    L6_1 = bm
    L6_1 = L6_1.RelatedStringBMReport
    L3_1(L4_1, L5_1, L6_1)
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
