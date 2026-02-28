local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = IsDeviceHVA
L0_1 = L0_1()
if L0_1 then
  L0_1 = ExtractDeviceProperties
  L0_1 = L0_1()
  L1_1 = L0_1.DeviceRoles
  L1_1 = L1_1.DomainController
  if L1_1 ~= nil then
    L1_1 = false
    L2_1 = bm
    L2_1 = L2_1.get_current_process_startup_info
    L2_1 = L2_1()
    L3_1 = pcall
    L4_1 = MpCommon
    L4_1 = L4_1.QuerySessionInformation
    L5_1 = L2_1.ppid
    L6_1 = MpCommon
    L6_1 = L6_1.WTSIsRemoteSession
    L3_1, L4_1 = L3_1(L4_1, L5_1, L6_1)
    L1_1 = L4_1
    _ = L3_1
    if L1_1 then
      L3_1 = mp
      L3_1 = L3_1.INFECTED
      return L3_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
