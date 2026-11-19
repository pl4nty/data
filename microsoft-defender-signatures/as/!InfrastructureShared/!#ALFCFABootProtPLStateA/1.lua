-- Threat: !InfrastructureShared
-- Name: !#ALF:CFABootProtPLState.A
-- Type: 13
-- MpAttributes: /CFABootProtStateScan

if mp.GetResmgrBasePlugin() ~= "Regkeyvalue" then
  return mp.CLEAN
end
local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
if l_0_0 == nil then
  return mp.CLEAN
end
if string.find(l_0_0, "hklm\\software\\microsoft\\windows defender\\diagnostics", 1, true) ~= nil then
  local l_0_1
  local l_0_2 = sysio.RegOpenKey("hklm\\software\\microsoft\\windows defender\\diagnostics")
  if l_0_2 then
    l_0_1 = sysio.GetRegValueAsDword(l_0_2, "MpPayloadStatus")
  end
  if l_0_1 == nil then
    return mp.CLEAN
  end
  local l_0_3 = {
    [4294966296] = "EXIT_CODE_EXCEPTION",
    [4294966295] = "EXIT_CODE_NO_DOMAIN_KEY",
    [4294966294] = "EXIT_CODE_QUERY_DOMAIN_FAILED",
    [4294966293] = "EXIT_CODE_INVALID_DOS_HEADER",
    [4294966292] = "EXIT_CODE_FAILED_TO_FIND_OVERLAY",
    [4294966291] = "EXIT_CODE_FAILED_TO_OPEN_CFA_KEY",
    [4294966290] = "EXIT_CODE_FAILED_TO_QUERY_CFA_KEY",
    [4294966289] = "EXIT_CODE_FAILED_TO_SET_CFA_KEY",
    [4294966288] = "EXIT_CODE_CFA_KEY_ALREADY_SET",
    [4294966287] = "EXIT_CODE_CFA_KEY_SET_SUCCESS",
    [4294966286] = "EXIT_CODE_CFA_ATOI_EXCEPTION"
  }
  local l_0_4 = l_0_3[tonumber(l_0_1)]
  if l_0_4 == nil then
    l_0_4 = tostring(l_0_1)
  end
  mp.set_mpattribute(string.format("MpInternal_researchdata=MpPayloadStatus=%s", l_0_4))
  MpCommon.SetPersistContextNoPath("MacMatchesHighRiskProtectionTarget", {"on"}, 0)
  local l_0_5 = 0
  local l_0_6 = sysio.RegOpenKey("hklm\\software\\microsoft\\windows defender\\windows defender exploit guard\\controlled folder access")
  if l_0_6 then
    l_0_5 = sysio.GetRegValueAsDword(l_0_6, "enablecontrolledfolderaccess")
  end
  if l_0_5 == nil then
    return mp.INFECTED
  end
  local l_0_7 = {
    [0] = "CFA_DISABLED",
    [1] = "CFA_BLOCK_MODE",
    [2] = "CFA_AUDIT_MODE",
    [3] = "CFA_BOOTDISK_BLOCK_MODE",
    [4] = "CFA_BOOTDISK_AUDIT_MODE"
  }
  local l_0_8 = l_0_7[tonumber(l_0_5)]
  if l_0_8 == nil then
    l_0_8 = tostring(l_0_5)
  end
  mp.set_mpattribute(string.format("MpInternal_researchdata=CFAStatus=%s", l_0_8))
  return mp.INFECTED
end
return mp.CLEAN
