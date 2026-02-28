local L0_1, L1_1, L2_1
L0_1 = reportRelatedBmHits
L0_1()
L0_1 = addRelatedProcess
L0_1()
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
if L0_1 ~= "" and L0_1 ~= nil then
  L1_1 = check_common_process_linux
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if L1_1 == false then
    L1_1 = bm
    L1_1 = L1_1.add_threat_file
    L2_1 = L0_1
    L1_1(L2_1)
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
