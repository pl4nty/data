local L0_1, L1_1, L2_1, L3_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.ContextualExpandEnvironmentVariables
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.utf8p1
  L0_1 = L0_1(L1_1)
  L1_1 = sysio
  L1_1 = L1_1.IsFileExists
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L1_1 = string
    L1_1 = L1_1.sub
    L2_1 = L0_1
    L3_1 = -3
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 == ".js" then
      L1_1 = bm
      L1_1 = L1_1.add_threat_file
      L2_1 = L0_1
      L1_1(L2_1)
    end
  end
end
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
