local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = GetRealPidForScenario
L2_1 = L0_1.ppid
L1_1 = L1_1(L2_1)
L2_1 = L0_1.command_line
L3_1 = bm
L3_1 = L3_1.get_imagepath
L3_1 = L3_1()
L4_1 = GetTacticsTableForPid
L5_1 = L1_1
L4_1 = L4_1(L5_1)
L5_1 = GetTechniquesTableForPid
L6_1 = L1_1
L5_1 = L5_1(L6_1)
L6_1 = GetTacticsTableGlobal
L6_1 = L6_1()
if L4_1 ~= nil and L5_1 ~= nil and L6_1 ~= nil then
  L7_1 = type
  L8_1 = L4_1
  L7_1 = L7_1(L8_1)
  if L7_1 == "table" then
    L7_1 = type
    L8_1 = L5_1
    L7_1 = L7_1(L8_1)
    if L7_1 == "table" then
      L7_1 = type
      L8_1 = L6_1
      L7_1 = L7_1(L8_1)
      if L7_1 == "table" then
        goto lbl_43
      end
    end
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
do return L7_1 end
::lbl_43::
L7_1 = IsExcludedByCmdlineMacOS
L8_1 = L2_1
L7_1 = L7_1(L8_1)
if not L7_1 then
  L7_1 = IsExcludedByImagePathMacOS
  L8_1 = L3_1
  L7_1 = L7_1(L8_1)
  if not L7_1 then
    goto lbl_56
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
do return L7_1 end
::lbl_56::

function L7_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = pairs
  L3_2 = A1_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    if L5_2 == A0_2 then
      L7_2 = true
      return L7_2
    end
  end
  L2_2 = false
  return L2_2
end

isKeyInTable = L7_1

function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = {}
  L2_2 = "DefenseEvasion_Masquerading"
  L3_2 = "Discovery_FileAndDirectoryDiscovery_Dirname"
  L4_2 = "Discovery_FileAndDirectoryDiscovery_Basename"
  L1_2[1] = L2_2
  L1_2[2] = L3_2
  L1_2[3] = L4_2
  L2_2 = ipairs
  L3_2 = L1_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    if L6_2 == A0_2 then
      L7_2 = true
      return L7_2
    end
  end
  L2_2 = false
  return L2_2
end

tactic_excluded = L7_1
L7_1 = {}
L8_1 = pairs
L9_1 = L4_1
L8_1, L9_1, L10_1 = L8_1(L9_1)
for L11_1, L12_1 in L8_1, L9_1, L10_1 do
  L13_1 = tactic_excluded
  L14_1 = L11_1
  L13_1 = L13_1(L14_1)
  if not L13_1 then
    L14_1 = L11_1
    L13_1 = L11_1.match
    L15_1 = "([^_]+)_"
    L13_1 = L13_1(L14_1, L15_1)
    if L13_1 then
      L14_1 = string
      L14_1 = L14_1.lower
      L15_1 = L13_1
      L14_1 = L14_1(L15_1)
      L13_1 = L14_1
      L14_1 = L7_1[L13_1]
      if L14_1 == nil then
        L7_1[L13_1] = 1
      else
        L14_1 = L7_1[L13_1]
        L14_1 = L14_1 + 1
        L7_1[L13_1] = L14_1
      end
    end
  end
end

function L8_1(A0_2)
  local L1_2
  L1_2 = L7_1
  L1_2 = L1_2[A0_2]
  if L1_2 ~= nil then
    L1_2 = L7_1
    L1_2 = L1_2[A0_2]
    if L1_2 ~= nil and L1_2 ~= "" and 0 < L1_2 then
      return L1_2
    end
  end
  L1_2 = 0
  return L1_2
end

getTacticCount = L8_1
L8_1 = AddResearchData
L9_1 = L1_1
L10_1 = true
L8_1(L9_1, L10_1)
L8_1 = reportRelatedBmHits
L8_1()
L8_1 = getTacticCount
L9_1 = "discovery"
L8_1 = L8_1(L9_1)
if 3 < L8_1 then
  L8_1 = isKeyInTable
  L9_1 = "Execution_UserExecution_UnsignedAdhocFile"
  L10_1 = L4_1
  L8_1 = L8_1(L9_1, L10_1)
  if L8_1 then
    goto lbl_383
  end
end
L8_1 = isKeyInTable
L9_1 = "InitialAccess_Phishing_SpearphishingLinkUnsigned"
L10_1 = L6_1
L8_1 = L8_1(L9_1, L10_1)
if not L8_1 then
  L8_1 = isKeyInTable
  L9_1 = "InitialAccess_Phishing_SpearphishingLinkNonBin"
  L10_1 = L6_1
  L8_1 = L8_1(L9_1, L10_1)
  if not L8_1 then
    L8_1 = isKeyInTable
    L9_1 = "InitialAccess_Phishing_SpearphishingLinkSigned"
    L10_1 = L6_1
    L8_1 = L8_1(L9_1, L10_1)
    if not L8_1 then
      goto lbl_140
    end
  end
end
L8_1 = isKeyInTable
L9_1 = "CommandAndControl_ProtocolTunneling_HTTPoverNonStandardPort"
L10_1 = L4_1
L8_1 = L8_1(L9_1, L10_1)
if not L8_1 then
  L8_1 = isKeyInTable
  L9_1 = "CommandAndControl_ProtocolTunneling_HTTPSoverNonStandardPort"
  L10_1 = L4_1
  L8_1 = L8_1(L9_1, L10_1)
  ::lbl_140::
  if not L8_1 then
    L8_1 = isKeyInTable
    L9_1 = "InitialAccess_Phishing_SpearphishingLinkUnsigned"
    L10_1 = L6_1
    L8_1 = L8_1(L9_1, L10_1)
    if not L8_1 then
      L8_1 = isKeyInTable
      L9_1 = "InitialAccess_Phishing_SpearphishingLinkNonBin"
      L10_1 = L6_1
      L8_1 = L8_1(L9_1, L10_1)
      if not L8_1 then
        L8_1 = isKeyInTable
        L9_1 = "InitialAccess_Phishing_SpearphishingLinkSigned"
        L10_1 = L6_1
        L8_1 = L8_1(L9_1, L10_1)
        if not L8_1 then
          goto lbl_164
        end
      end
    end
    L8_1 = isKeyInTable
    L9_1 = "DefenseEvasion_GateKeeperBypass_xattr"
    L10_1 = L4_1
    L8_1 = L8_1(L9_1, L10_1)
    ::lbl_164::
    if not L8_1 then
      L8_1 = isKeyInTable
      L9_1 = "InitialAccess_Phishing_SpearphishingLinkUnsigned"
      L10_1 = L6_1
      L8_1 = L8_1(L9_1, L10_1)
      if not L8_1 then
        L8_1 = isKeyInTable
        L9_1 = "InitialAccess_Phishing_SpearphishingLinkNonBin"
        L10_1 = L6_1
        L8_1 = L8_1(L9_1, L10_1)
        if not L8_1 then
          L8_1 = isKeyInTable
          L9_1 = "InitialAccess_Phishing_SpearphishingLinkSigned"
          L10_1 = L6_1
          L8_1 = L8_1(L9_1, L10_1)
          if not L8_1 then
            goto lbl_188
          end
        end
      end
      L8_1 = isKeyInTable
      L9_1 = "DefenseEvasion_PermissionModification_MacChmodToExec"
      L10_1 = L4_1
      L8_1 = L8_1(L9_1, L10_1)
      ::lbl_188::
      if not L8_1 then
        L8_1 = isKeyInTable
        L9_1 = "InitialAccess_Phishing_SpearphishingLinkUnsigned"
        L10_1 = L6_1
        L8_1 = L8_1(L9_1, L10_1)
        if not L8_1 then
          L8_1 = isKeyInTable
          L9_1 = "InitialAccess_Phishing_SpearphishingLinkNonBin"
          L10_1 = L6_1
          L8_1 = L8_1(L9_1, L10_1)
          if not L8_1 then
            L8_1 = isKeyInTable
            L9_1 = "InitialAccess_Phishing_SpearphishingLinkSigned"
            L10_1 = L6_1
            L8_1 = L8_1(L9_1, L10_1)
            if not L8_1 then
              goto lbl_218
            end
          end
        end
        L8_1 = isKeyInTable
        L9_1 = "DefenseEvasion_PermissionModification_MacChmodToExec"
        L10_1 = L4_1
        L8_1 = L8_1(L9_1, L10_1)
        if L8_1 then
          L8_1 = isKeyInTable
          L9_1 = "Execution_ShellOrInterpreter_General"
          L10_1 = L4_1
          L8_1 = L8_1(L9_1, L10_1)
          if L8_1 then
            goto lbl_383
          end
        end
        ::lbl_218::
        L8_1 = isKeyInTable
        L9_1 = "InitialAccess_Phishing_SpearphishingLinkUnsigned"
        L10_1 = L6_1
        L8_1 = L8_1(L9_1, L10_1)
        if not L8_1 then
          L8_1 = isKeyInTable
          L9_1 = "InitialAccess_Phishing_SpearphishingLinkNonBin"
          L10_1 = L6_1
          L8_1 = L8_1(L9_1, L10_1)
          if not L8_1 then
            L8_1 = isKeyInTable
            L9_1 = "InitialAccess_Phishing_SpearphishingLinkSigned"
            L10_1 = L6_1
            L8_1 = L8_1(L9_1, L10_1)
            if not L8_1 then
              goto lbl_242
            end
          end
        end
        L8_1 = isKeyInTable
        L9_1 = "Execution_ShellOrInterpreter_General"
        L10_1 = L4_1
        L8_1 = L8_1(L9_1, L10_1)
        ::lbl_242::
        if not L8_1 then
          L8_1 = isKeyInTable
          L9_1 = "CommandAndControl_IngressToolTransfer_Curl"
          L10_1 = L4_1
          L8_1 = L8_1(L9_1, L10_1)
          if not L8_1 then
            L8_1 = isKeyInTable
            L9_1 = "CommandAndControl_IngressToolTransfer_withCurl"
            L10_1 = L4_1
            L8_1 = L8_1(L9_1, L10_1)
            if not L8_1 then
              L8_1 = isKeyInTable
              L9_1 = "CommandAndControl_IngressToolTransfer_Nscurl"
              L10_1 = L4_1
              L8_1 = L8_1(L9_1, L10_1)
              if not L8_1 then
                L8_1 = isKeyInTable
                L9_1 = "CommandAndControl_IngressToolTransfer_Nscurl2"
                L10_1 = L4_1
                L8_1 = L8_1(L9_1, L10_1)
                if not L8_1 then
                  goto lbl_272
                end
              end
            end
          end
          L8_1 = isKeyInTable
          L9_1 = "Masquerading_SuspFileNames_DPRK"
          L10_1 = L4_1
          L8_1 = L8_1(L9_1, L10_1)
          ::lbl_272::
          if not L8_1 then
            L8_1 = isKeyInTable
            L9_1 = "CommandAndControl_IngressToolTransfer_Curl"
            L10_1 = L4_1
            L8_1 = L8_1(L9_1, L10_1)
            if not L8_1 then
              L8_1 = isKeyInTable
              L9_1 = "CommandAndControl_IngressToolTransfer_withCurl"
              L10_1 = L4_1
              L8_1 = L8_1(L9_1, L10_1)
              if not L8_1 then
                L8_1 = isKeyInTable
                L9_1 = "CommandAndControl_IngressToolTransfer_Nscurl"
                L10_1 = L4_1
                L8_1 = L8_1(L9_1, L10_1)
                if not L8_1 then
                  L8_1 = isKeyInTable
                  L9_1 = "CommandAndControl_IngressToolTransfer_Nscurl2"
                  L10_1 = L4_1
                  L8_1 = L8_1(L9_1, L10_1)
                  if not L8_1 then
                    goto lbl_308
                  end
                end
              end
            end
            L8_1 = isKeyInTable
            L9_1 = "Masquerading_SuspFileNames_DPRK"
            L10_1 = L4_1
            L8_1 = L8_1(L9_1, L10_1)
            if L8_1 then
              L8_1 = isKeyInTable
              L9_1 = "Execution_UserExecution_UnsignedAdhocFile"
              L10_1 = L4_1
              L8_1 = L8_1(L9_1, L10_1)
              if L8_1 then
                goto lbl_383
              end
            end
            ::lbl_308::
            L8_1 = isKeyInTable
            L9_1 = "CommandAndControl_IngressToolTransfer_UsingKoreanDomains"
            L10_1 = L4_1
            L8_1 = L8_1(L9_1, L10_1)
            if L8_1 then
              L8_1 = isKeyInTable
              L9_1 = "Masquerading_SuspFileNames_DPRK"
              L10_1 = L4_1
              L8_1 = L8_1(L9_1, L10_1)
              if L8_1 then
                goto lbl_383
              end
            end
            L8_1 = isKeyInTable
            L9_1 = "CommandAndControl_IngressToolTransfer_SuspScriptUsingHttp"
            L10_1 = L4_1
            L8_1 = L8_1(L9_1, L10_1)
            if L8_1 then
              L8_1 = isKeyInTable
              L9_1 = "Masquerading_SuspFileNames_DPRK"
              L10_1 = L4_1
              L8_1 = L8_1(L9_1, L10_1)
              if L8_1 then
                goto lbl_383
              end
            end
            L8_1 = isKeyInTable
            L9_1 = "Execution_UserExecution_UnsignedAdhocFile"
            L10_1 = L4_1
            L8_1 = L8_1(L9_1, L10_1)
            if L8_1 then
              L8_1 = isKeyInTable
              L9_1 = "Masquerading_SuspFileNames_DPRK"
              L10_1 = L4_1
              L8_1 = L8_1(L9_1, L10_1)
              if L8_1 then
                L8_1 = getTacticCount
                L9_1 = "persistence"
                L8_1 = L8_1(L9_1)
                if 0 < L8_1 then
                  goto lbl_383
                end
              end
            end
            L8_1 = isKeyInTable
            L9_1 = "Execution_UserExecution_UnsignedAdhocFile"
            L10_1 = L4_1
            L8_1 = L8_1(L9_1, L10_1)
            if L8_1 then
              L8_1 = getTacticCount
              L9_1 = "persistence"
              L8_1 = L8_1(L9_1)
              if 0 < L8_1 then
                L8_1 = isKeyInTable
                L9_1 = "Execution_SystemServices_Launchctl"
                L10_1 = L4_1
                L8_1 = L8_1(L9_1, L10_1)
                if L8_1 then
                  goto lbl_383
                end
              end
            end
            L8_1 = getTacticCount
            L9_1 = "discovery"
            L8_1 = L8_1(L9_1)
            if not (1 < L8_1) then
              goto lbl_386
            end
            L8_1 = isKeyInTable
            L9_1 = "Execution_UserExecution_UnsignedAdhocFile"
            L10_1 = L4_1
            L8_1 = L8_1(L9_1, L10_1)
            if not L8_1 then
              goto lbl_386
            end
            L8_1 = isKeyInTable
            L9_1 = "CredentialAccess_CredentialsfromPasswordStores_Keychain"
            L10_1 = L4_1
            L8_1 = L8_1(L9_1, L10_1)
            if not L8_1 then
              goto lbl_386
            end
          end
        end
      end
    end
  end
end
::lbl_383::
L8_1 = mp
L8_1 = L8_1.INFECTED
do return L8_1 end
::lbl_386::
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
