local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = verify_memory_features_coverage_orgs
L0_1 = L0_1()
if L0_1 then
  L0_1 = bm
  L0_1 = L0_1.get_imagepath
  L0_1 = L0_1()
  if L0_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.match
    L2_1 = L0_1
    L3_1 = "/bin/%a*sh"
    L1_1 = L1_1(L2_1, L3_1)
    if not L1_1 then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "perl"
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if not L1_1 then
        L1_1 = string
        L1_1 = L1_1.find
        L2_1 = L0_1
        L3_1 = "python"
        L4_1 = 1
        L5_1 = true
        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
        if not L1_1 then
          goto lbl_38
        end
      end
    end
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
::lbl_38::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
