local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FULL
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.match
L2_1 = L0_1
L3_1 = "\\microsoft shared\\web server extensions\\%d%d\\template\\layouts\\"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = IsSharepointServer
L1_1 = L1_1()
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = IsDeviceHVA
L1_1 = L1_1()
if L1_1 then
  L1_1 = ExtractDeviceProperties
  L1_1 = L1_1()
  L2_1 = L1_1.DeviceRoles
  if L2_1 then
    L2_1 = L1_1.DeviceRoles
    L2_1 = L2_1.SharePointServer
    if L2_1 ~= nil then
      L2_1 = mp
      L2_1 = L2_1.INFECTED
      return L2_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
