local L0_1, L1_1, L2_1
L0_1 = this_sigattrlog
L0_1 = L0_1[5]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[5]
  L0_1 = L0_1.utf8p1
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[5]
    L0_1 = L0_1.utf8p1
    if L0_1 ~= "" then
      L0_1 = string
      L0_1 = L0_1.match
      L1_1 = this_sigattrlog
      L1_1 = L1_1[5]
      L1_1 = L1_1.utf8p1
      L2_1 = "/%.[^/]+$"
      L0_1 = L0_1(L1_1, L2_1)
      if L0_1 then
        L0_1 = bm
        L0_1 = L0_1.trigger_sig
        L1_1 = "HiddenProcessCreate"
        L2_1 = this_sigattrlog
        L2_1 = L2_1[5]
        L2_1 = L2_1.utf8p1
        L0_1(L1_1, L2_1)
        L0_1 = mp
        L0_1 = L0_1.INFECTED
        return L0_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
