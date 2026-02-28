local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_FILEPATH
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = "\\appdata\\"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 == nil then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L1_1
    L4_1 = "\\programdata\\"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 == nil then
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L1_1
      L4_1 = "\\progra~1\\"
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if L2_1 == nil then
        goto lbl_42
      end
    end
  end
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
::lbl_42::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
