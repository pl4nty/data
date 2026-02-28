local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.FILEPATH_QUERY_LOWERCASE
L0_1 = L0_1(L1_1)
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "%-%>%(script000%d%)"
L4_1 = -15
L1_1 = L1_1(L2_1, L3_1, L4_1)
if L1_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.get_parent_filehandle
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = mp
  L2_1 = L2_1.getfilesize
  L2_1 = L2_1()
  L3_1 = mp
  L3_1 = L3_1.get_filesize_by_handle
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  L4_1 = L3_1 * 85
  L4_1 = L4_1 / 100
  if L2_1 > L4_1 then
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
