local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = bm
L0_1 = L0_1.DisableSignature
L0_1()
L0_1 = nil
L1_1 = nil
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L0_1 = L2_1.utf8p2
end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L2_1 = L2_1.utf8p2
    if L2_1 ~= nil then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[2]
      L0_1 = L2_1.utf8p2
  end
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[3]
    L2_1 = L2_1.matched
    if L2_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[3]
      L2_1 = L2_1.utf8p2
      if L2_1 ~= nil then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[3]
        L0_1 = L2_1.utf8p2
    end
    else
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
      end
    end
  end
end
L2_1 = contains
L3_1 = L0_1
L4_1 = "%-[eE][ncodemaNCODEMA]*%s+\"?%s*([A-Za-z0-9/%+=]+)"
L5_1 = false
L2_1 = L2_1(L3_1, L4_1, L5_1)
if not L2_1 then
  L2_1 = contains
  L3_1 = L0_1
  L4_1 = "\226\128\147[eE][ncodemaNCODEMA]*%s+\"?%s*([A-Za-z0-9/%+=]+)"
  L5_1 = false
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  if not L2_1 then
    goto lbl_79
  end
end
L2_1 = NormalizeCmdline
L3_1 = "powershell"
L4_1 = L0_1
L2_1 = L2_1(L3_1, L4_1)
L1_1 = L2_1
::lbl_79::
if L1_1 == nil or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
if L0_1 ~= L1_1 then
  L2_1 = bm
  L2_1 = L2_1.trigger_sig
  L3_1 = "PShellB64Decode"
  L4_1 = L1_1
  L2_1(L3_1, L4_1)
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
