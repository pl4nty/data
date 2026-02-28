local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = mp
L0_1 = L0_1.GetResmgrBasePlugin
L0_1 = L0_1()
if L0_1 ~= "Regkeyvalue" then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_FILEPATH
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1 = L1_1(L2_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "hklm\\software\\microsoft\\windows defender\\diagnostics"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 ~= nil then
  L1_1 = nil
  L2_1 = sysio
  L2_1 = L2_1.RegOpenKey
  L3_1 = "hklm\\software\\microsoft\\windows defender\\diagnostics"
  L2_1 = L2_1(L3_1)
  if L2_1 then
    L3_1 = sysio
    L3_1 = L3_1.GetRegValueAsDword
    L4_1 = L2_1
    L5_1 = "MpPayloadStatus"
    L3_1 = L3_1(L4_1, L5_1)
    L1_1 = L3_1
  end
  if L1_1 == nil then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = {}
  L3_1[4294966296] = "EXIT_CODE_EXCEPTION"
  L3_1[4294966295] = "EXIT_CODE_NO_DOMAIN_KEY"
  L3_1[4294966294] = "EXIT_CODE_QUERY_DOMAIN_FAILED"
  L3_1[4294966293] = "EXIT_CODE_INVALID_DOS_HEADER"
  L3_1[4294966292] = "EXIT_CODE_FAILED_TO_FIND_OVERLAY"
  L3_1[4294966291] = "EXIT_CODE_FAILED_TO_OPEN_CFA_KEY"
  L3_1[4294966290] = "EXIT_CODE_FAILED_TO_QUERY_CFA_KEY"
  L3_1[4294966289] = "EXIT_CODE_FAILED_TO_SET_CFA_KEY"
  L3_1[4294966288] = "EXIT_CODE_CFA_KEY_ALREADY_SET"
  L3_1[4294966287] = "EXIT_CODE_CFA_KEY_SET_SUCCESS"
  L3_1[4294966286] = "EXIT_CODE_CFA_ATOI_EXCEPTION"
  L4_1 = tonumber
  L5_1 = L1_1
  L4_1 = L4_1(L5_1)
  L4_1 = L3_1[L4_1]
  if L4_1 == nil then
    L5_1 = tostring
    L6_1 = L1_1
    L5_1 = L5_1(L6_1)
    L4_1 = L5_1
  end
  L5_1 = mp
  L5_1 = L5_1.set_mpattribute
  L6_1 = string
  L6_1 = L6_1.format
  L7_1 = "MpInternal_researchdata=MpPayloadStatus=%s"
  L8_1 = L4_1
  L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1 = L6_1(L7_1, L8_1)
  L5_1(L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
  L5_1 = MpCommon
  L5_1 = L5_1.SetPersistContextNoPath
  L6_1 = "MacMatchesHighRiskProtectionTarget"
  L7_1 = {}
  L8_1 = "on"
  L7_1[1] = L8_1
  L8_1 = 0
  L5_1(L6_1, L7_1, L8_1)
  L5_1 = 0
  L6_1 = sysio
  L6_1 = L6_1.RegOpenKey
  L7_1 = "hklm\\software\\microsoft\\windows defender\\windows defender exploit guard\\controlled folder access"
  L6_1 = L6_1(L7_1)
  if L6_1 then
    L7_1 = sysio
    L7_1 = L7_1.GetRegValueAsDword
    L8_1 = L6_1
    L9_1 = "enablecontrolledfolderaccess"
    L7_1 = L7_1(L8_1, L9_1)
    L5_1 = L7_1
  end
  if L5_1 == nil then
    L7_1 = mp
    L7_1 = L7_1.INFECTED
    return L7_1
  end
  L7_1 = {}
  L7_1[0] = "CFA_DISABLED"
  L7_1[1] = "CFA_BLOCK_MODE"
  L7_1[2] = "CFA_AUDIT_MODE"
  L7_1[3] = "CFA_BOOTDISK_BLOCK_MODE"
  L7_1[4] = "CFA_BOOTDISK_AUDIT_MODE"
  L8_1 = tonumber
  L9_1 = L5_1
  L8_1 = L8_1(L9_1)
  L8_1 = L7_1[L8_1]
  if L8_1 == nil then
    L9_1 = tostring
    L10_1 = L5_1
    L9_1 = L9_1(L10_1)
    L8_1 = L9_1
  end
  L9_1 = mp
  L9_1 = L9_1.set_mpattribute
  L10_1 = string
  L10_1 = L10_1.format
  L11_1 = "MpInternal_researchdata=CFAStatus=%s"
  L12_1 = L8_1
  L10_1, L11_1, L12_1 = L10_1(L11_1, L12_1)
  L9_1(L10_1, L11_1, L12_1)
  L9_1 = mp
  L9_1 = L9_1.INFECTED
  return L9_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
