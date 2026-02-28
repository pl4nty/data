local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_FILEPATH
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = ""
end
L2_1 = L0_1
L1_1 = L0_1.lower
L1_1 = L1_1(L2_1)
L2_1 = L1_1
L1_1 = L1_1.find
L3_1 = "kustomultiplexer\\ingestions"
L1_1 = L1_1(L2_1, L3_1)
if nil ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.get_contextdata
  L2_1 = mp
  L2_1 = L2_1.CONTEXT_DATA_FILENAME
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    L1_1 = ""
  end
  L3_1 = L1_1
  L2_1 = L1_1.lower
  L2_1 = L2_1(L3_1)
  L3_1 = L2_1
  L2_1 = L2_1.sub
  L4_1 = -4
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 == ".zip" then
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
