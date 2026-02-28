local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
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
  L4_1 = "vmblastsg"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 then
    L0_1 = L1_1
  end
else
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = contains
L3_1 = L0_1
L4_1 = "absg-worker.js"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = contains
  L3_1 = L0_1
  L4_1 = "req.connection.end"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
