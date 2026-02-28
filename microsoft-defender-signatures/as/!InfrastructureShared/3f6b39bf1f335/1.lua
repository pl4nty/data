local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
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
L4_1 = "downloadstring"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
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
    L4_1 = "downloadstring"
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 then
      L0_1 = L1_1
    end
  else
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
end
L2_1 = {}
L3_1 = "\\landesk\\ldclient\\ivanti-psmodule"
L2_1[1] = L3_1
L3_1 = contains
L4_1 = L0_1
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = {}
L4_1 = "iex"
L5_1 = "invoke-expression"
L3_1[1] = L4_1
L3_1[2] = L5_1
L4_1 = contains
L5_1 = L0_1
L6_1 = L3_1
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L4_1 = {}
  L5_1 = "pastebin.com"
  L6_1 = "paste.ee"
  L7_1 = "j.mp"
  L8_1 = "textbin.net"
  L4_1[1] = L5_1
  L4_1[2] = L6_1
  L4_1[3] = L7_1
  L4_1[4] = L8_1
  L5_1 = contains
  L6_1 = L0_1
  L7_1 = L4_1
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 then
    L5_1 = IsProcNameInParentProcessTree
    L6_1 = "BM"
    L7_1 = "wmiprvse.exe"
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 then
      L5_1 = mp
      L5_1 = L5_1.TriggerScanResource
      L6_1 = "wmi"
      L7_1 = ""
      L5_1(L6_1, L7_1)
    end
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
