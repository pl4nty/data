local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FULL
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "\\microsoft azure ad sync\\bin\\"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 ~= nil then
  L1_1 = IsDeviceHVA
  L1_1 = L1_1()
  if L1_1 then
    L1_1 = ExtractDeviceProperties
    L1_1 = L1_1()
    L2_1 = L1_1.DeviceRoles
    if L2_1 then
      L2_1 = L1_1.DeviceRoles
      L2_1 = L2_1.EntraConnectServer
      if L2_1 == nil then
        L2_1 = L1_1.DeviceRoles
        L2_1 = L2_1.EntraCloudSyncServer
        if L2_1 == nil then
          L2_1 = L1_1.DeviceRoles
          L2_1 = L2_1.AzureADConnectServer
          if L2_1 == nil then
            goto lbl_49
          end
        end
      end
      L2_1 = mp
      L2_1 = L2_1.INFECTED
      return L2_1
    end
  end
end
::lbl_49::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
