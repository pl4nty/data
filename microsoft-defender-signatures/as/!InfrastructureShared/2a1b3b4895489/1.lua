-- Threat: !InfrastructureShared
-- Name: 2a1b3b4895489
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = GetRealPidForScenario(l_0_0.ppid)
local l_0_2 = l_0_0.command_line
local l_0_3 = bm.get_imagepath()
local l_0_4 = GetTacticsTableForPid(l_0_1)
local l_0_5 = GetTechniquesTableForPid(l_0_1)
local l_0_6 = GetTacticsTableGlobal()
if l_0_4 == nil or l_0_5 == nil or l_0_6 == nil or type(l_0_4) ~= "table" or type(l_0_5) ~= "table" or type(l_0_6) ~= "table" then
  return mp.CLEAN
end
if IsExcludedByCmdlineMacOS(l_0_2) or IsExcludedByImagePathMacOS(l_0_3) then
  return mp.CLEAN
end

function isKeyInTable(l_1_0, l_1_1)
  for l_1_2, l_1_3 in pairs(l_1_1) do
    if l_1_2 == l_1_0 then
      return true
    end
  end
  return false
end

function tactic_excluded(l_2_0)
  local l_2_1 = {
    "DefenseEvasion_Masquerading",
    "Discovery_FileAndDirectoryDiscovery_Dirname",
    "Discovery_FileAndDirectoryDiscovery_Basename"
  }
  for l_2_2, l_2_3 in ipairs(l_2_1) do
    if l_2_3 == l_2_0 then
      return true
    end
  end
  return false
end

local l_0_7 = {}
for l_0_8, l_0_9 in pairs(l_0_4) do
  if not tactic_excluded(l_0_8) then
    local l_0_10 = l_0_8:match("([^_]+)_")
    if l_0_10 then
      l_0_10 = string.lower(l_0_10)
      if l_0_7[l_0_10] == nil then
        l_0_7[l_0_10] = 1
      else
        l_0_7[l_0_10] = l_0_7[l_0_10] + 1
      end
    end
  end
end

function getTacticCount(l_3_0)
  if l_0_7[l_3_0] ~= nil then
    local l_3_1 = l_0_7[l_3_0]
    if l_3_1 ~= nil and l_3_1 ~= "" and 0 < l_3_1 then
      return l_3_1
    end
  end
  return 0
end

AddResearchData(l_0_1, true)
reportRelatedBmHits()
if getTacticCount("discovery") > 3 and isKeyInTable("Execution_UserExecution_UnsignedAdhocFile", l_0_4) or (isKeyInTable("InitialAccess_Phishing_SpearphishingLinkUnsigned", l_0_6) or isKeyInTable("InitialAccess_Phishing_SpearphishingLinkNonBin", l_0_6) or isKeyInTable("InitialAccess_Phishing_SpearphishingLinkSigned", l_0_6)) and (isKeyInTable("CommandAndControl_ProtocolTunneling_HTTPoverNonStandardPort", l_0_4) or isKeyInTable("CommandAndControl_ProtocolTunneling_HTTPSoverNonStandardPort", l_0_4)) or (isKeyInTable("InitialAccess_Phishing_SpearphishingLinkUnsigned", l_0_6) or isKeyInTable("InitialAccess_Phishing_SpearphishingLinkNonBin", l_0_6) or isKeyInTable("InitialAccess_Phishing_SpearphishingLinkSigned", l_0_6)) and isKeyInTable("DefenseEvasion_GateKeeperBypass_xattr", l_0_4) or (isKeyInTable("InitialAccess_Phishing_SpearphishingLinkUnsigned", l_0_6) or isKeyInTable("InitialAccess_Phishing_SpearphishingLinkNonBin", l_0_6) or isKeyInTable("InitialAccess_Phishing_SpearphishingLinkSigned", l_0_6)) and isKeyInTable("DefenseEvasion_PermissionModification_MacChmodToExec", l_0_4) or (isKeyInTable("InitialAccess_Phishing_SpearphishingLinkUnsigned", l_0_6) or isKeyInTable("InitialAccess_Phishing_SpearphishingLinkNonBin", l_0_6) or isKeyInTable("InitialAccess_Phishing_SpearphishingLinkSigned", l_0_6)) and isKeyInTable("DefenseEvasion_PermissionModification_MacChmodToExec", l_0_4) and isKeyInTable("Execution_ShellOrInterpreter_General", l_0_4) or (isKeyInTable("InitialAccess_Phishing_SpearphishingLinkUnsigned", l_0_6) or isKeyInTable("InitialAccess_Phishing_SpearphishingLinkNonBin", l_0_6) or isKeyInTable("InitialAccess_Phishing_SpearphishingLinkSigned", l_0_6)) and isKeyInTable("Execution_ShellOrInterpreter_General", l_0_4) or (isKeyInTable("CommandAndControl_IngressToolTransfer_Curl", l_0_4) or isKeyInTable("CommandAndControl_IngressToolTransfer_withCurl", l_0_4) or isKeyInTable("CommandAndControl_IngressToolTransfer_Nscurl", l_0_4) or isKeyInTable("CommandAndControl_IngressToolTransfer_Nscurl2", l_0_4)) and isKeyInTable("Masquerading_SuspFileNames_DPRK", l_0_4) or (isKeyInTable("CommandAndControl_IngressToolTransfer_Curl", l_0_4) or isKeyInTable("CommandAndControl_IngressToolTransfer_withCurl", l_0_4) or isKeyInTable("CommandAndControl_IngressToolTransfer_Nscurl", l_0_4) or isKeyInTable("CommandAndControl_IngressToolTransfer_Nscurl2", l_0_4)) and isKeyInTable("Masquerading_SuspFileNames_DPRK", l_0_4) and isKeyInTable("Execution_UserExecution_UnsignedAdhocFile", l_0_4) or isKeyInTable("CommandAndControl_IngressToolTransfer_UsingKoreanDomains", l_0_4) and isKeyInTable("Masquerading_SuspFileNames_DPRK", l_0_4) or isKeyInTable("CommandAndControl_IngressToolTransfer_SuspScriptUsingHttp", l_0_4) and isKeyInTable("Masquerading_SuspFileNames_DPRK", l_0_4) or isKeyInTable("Execution_UserExecution_UnsignedAdhocFile", l_0_4) and isKeyInTable("Masquerading_SuspFileNames_DPRK", l_0_4) and getTacticCount("persistence") > 0 or isKeyInTable("Execution_UserExecution_UnsignedAdhocFile", l_0_4) and getTacticCount("persistence") > 0 and isKeyInTable("Execution_SystemServices_Launchctl", l_0_4) or 1 < getTacticCount("discovery") and isKeyInTable("Execution_UserExecution_UnsignedAdhocFile", l_0_4) and isKeyInTable("CredentialAccess_CredentialsfromPasswordStores_Keychain", l_0_4) then
  return mp.INFECTED
end
return mp.CLEAN
