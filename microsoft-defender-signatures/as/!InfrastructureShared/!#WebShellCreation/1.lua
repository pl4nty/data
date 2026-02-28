local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L0_1 ~= L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.IsHipsRuleEnabled
L2_1 = "a8f5898e-1dc8-49a9-9878-85004b8a61e6"
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = "enghipscpy:blockaccess:a8f5898e-1dc8-49a9-9878-85004b8a61e6"
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_FILENAME
L2_1 = L2_1(L3_1)
if L2_1 == nil or L2_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L2_1 = L3_1
L3_1 = mp
L3_1 = L3_1.getfilename
L4_1 = mp
L4_1 = L4_1.bitor
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_FULL
L6_1 = mp
L6_1 = L6_1.FILEPATH_QUERY_LOWERCASE
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1 = L4_1(L5_1, L6_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1)
if L3_1 == nil or L3_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.lower
L5_1 = MpCommon
L5_1 = L5_1.PathToWin32Path
L6_1 = L3_1
L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1 = L5_1(L6_1)
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1)
L3_1 = L4_1
L4_1 = mp
L4_1 = L4_1.IsPathExcludedForHipsRule
L5_1 = L3_1
L6_1 = "a8f5898e-1dc8-49a9-9878-85004b8a61e6"
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.SCANREASON_ONOPEN
if L0_1 == L4_1 then
  L4_1 = MpCommon
  L4_1 = L4_1.QueryPersistContext
  L5_1 = L3_1
  L6_1 = L1_1
  L4_1 = L4_1(L5_1, L6_1)
  if not L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = mp
  L4_1 = L4_1.set_mpattribute
  L5_1 = "MpDisableCaching"
  L4_1(L5_1)
  L4_1 = mp
  L4_1 = L4_1.SetHipsRule
  L5_1 = "a8f5898e-1dc8-49a9-9878-85004b8a61e6"
  L4_1(L5_1)
  L4_1 = mp
  L4_1 = L4_1.BLOCKEXECUTION
  return L4_1
else
  L4_1 = mp
  L4_1 = L4_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L0_1 == L4_1 then
    L4_1 = mp
    L4_1 = L4_1.get_contextdata
    L5_1 = mp
    L5_1 = L5_1.CONTEXT_DATA_NEWLYCREATEDHINT
    L4_1 = L4_1(L5_1)
    if not L4_1 then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    L4_1 = MpCommon
    L4_1 = L4_1.ExpandEnvironmentVariables
    L5_1 = "%ExchangeInstallPath%"
    L4_1 = L4_1(L5_1)
    if L4_1 == nil or L4_1 == "" then
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      return L5_1
    end
    L5_1 = sysio
    L5_1 = L5_1.IsFileExists
    L6_1 = L4_1
    L7_1 = "bin\\Microsoft.Exchange.Store.Service.exe"
    L6_1 = L6_1 .. L7_1
    L5_1 = L5_1(L6_1)
    if not L5_1 then
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      return L5_1
    end
    L5_1 = string
    L5_1 = L5_1.lower
    L6_1 = L4_1
    L5_1 = L5_1(L6_1)
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L3_1
    L8_1 = L5_1
    L9_1 = "clientaccess\\oab\\temp\\"
    L8_1 = L8_1 .. L9_1
    L9_1 = 1
    L10_1 = true
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
    if L6_1 ~= nil then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
    if L2_1 == "asrtestfile-a8f5898e-1dc8-49a9-9878-85004b8a61e6.asp" then
      L6_1 = mp
      L6_1 = L6_1.set_mpattribute
      L7_1 = "MpDisableCaching"
      L6_1(L7_1)
      L6_1 = MpCommon
      L6_1 = L6_1.GetPersistContextCount
      L7_1 = L3_1
      L6_1 = L6_1(L7_1)
      if L6_1 == 0 then
        L6_1 = {}
        L7_1 = table
        L7_1 = L7_1.insert
        L8_1 = L6_1
        L9_1 = L1_1
        L7_1(L8_1, L9_1)
        L7_1 = MpCommon
        L7_1 = L7_1.SetPersistContext
        L8_1 = L3_1
        L9_1 = L6_1
        L10_1 = 0
        L7_1(L8_1, L9_1, L10_1)
      else
        L6_1 = MpCommon
        L6_1 = L6_1.QueryPersistContext
        L7_1 = L3_1
        L8_1 = L1_1
        L6_1 = L6_1(L7_1, L8_1)
        if not L6_1 then
          L6_1 = MpCommon
          L6_1 = L6_1.AppendPersistContext
          L7_1 = L3_1
          L8_1 = L1_1
          L9_1 = 0
          L6_1(L7_1, L8_1, L9_1)
        end
      end
      L6_1 = mp
      L6_1 = L6_1.SetHipsRule
      L7_1 = "a8f5898e-1dc8-49a9-9878-85004b8a61e6"
      L6_1(L7_1)
      L6_1 = mp
      L6_1 = L6_1.BLOCKACCESS
      return L6_1
    else
      L6_1 = MpCommon
      L6_1 = L6_1.ExpandEnvironmentVariables
      L7_1 = "%SystemDrive%\\inetpub\\wwwroot"
      L6_1 = L6_1(L7_1)
      if L6_1 == nil or L6_1 == "" then
        L7_1 = mp
        L7_1 = L7_1.CLEAN
        return L7_1
      end
      L7_1 = string
      L7_1 = L7_1.lower
      L8_1 = L6_1
      L7_1 = L7_1(L8_1)
      if L7_1 == nil or L7_1 == "" then
        L8_1 = mp
        L8_1 = L8_1.CLEAN
        return L8_1
      end
      L8_1 = string
      L8_1 = L8_1.find
      L9_1 = L3_1
      L10_1 = L7_1
      L11_1 = 1
      L12_1 = true
      L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
      if L8_1 then
        L8_1 = mp
        L8_1 = L8_1.set_mpattribute
        L9_1 = "MpDisableCaching"
        L8_1(L9_1)
        L8_1 = MpCommon
        L8_1 = L8_1.GetPersistContextCount
        L9_1 = L3_1
        L8_1 = L8_1(L9_1)
        if L8_1 == 0 then
          L8_1 = {}
          L9_1 = table
          L9_1 = L9_1.insert
          L10_1 = L8_1
          L11_1 = L1_1
          L9_1(L10_1, L11_1)
          L9_1 = MpCommon
          L9_1 = L9_1.SetPersistContext
          L10_1 = L3_1
          L11_1 = L8_1
          L12_1 = 0
          L9_1(L10_1, L11_1, L12_1)
        else
          L8_1 = MpCommon
          L8_1 = L8_1.QueryPersistContext
          L9_1 = L3_1
          L10_1 = L1_1
          L8_1 = L8_1(L9_1, L10_1)
          if not L8_1 then
            L8_1 = MpCommon
            L8_1 = L8_1.AppendPersistContext
            L9_1 = L3_1
            L10_1 = L1_1
            L11_1 = 0
            L8_1(L9_1, L10_1, L11_1)
          end
        end
        L8_1 = mp
        L8_1 = L8_1.SetHipsRule
        L9_1 = "a8f5898e-1dc8-49a9-9878-85004b8a61e6"
        L8_1(L9_1)
        L8_1 = mp
        L8_1 = L8_1.BLOCKACCESS
        return L8_1
      end
      L8_1 = MpCommon
      L8_1 = L8_1.ExpandEnvironmentVariables
      L9_1 = "%windir%\\system32\\inetsrv\\config\\applicationHost.config"
      L8_1 = L8_1(L9_1)
      if L8_1 == nil or L8_1 == "" then
        L9_1 = mp
        L9_1 = L9_1.CLEAN
        return L9_1
      end
      L9_1 = MpCommon
      L9_1 = L9_1.GetIisInstallPaths
      L10_1 = L8_1
      L9_1 = L9_1(L10_1)
      if L9_1 == nil or L9_1 == "" then
        L10_1 = mp
        L10_1 = L10_1.CLEAN
        return L10_1
      end
      L10_1 = ipairs
      L11_1 = L9_1
      L10_1, L11_1, L12_1 = L10_1(L11_1)
      for L13_1, L14_1 in L10_1, L11_1, L12_1 do
        L15_1 = L14_1.Path
        if L15_1 ~= nil then
          L15_1 = L14_1.Path
          if L15_1 ~= "" then
            L15_1 = string
            L15_1 = L15_1.find
            L16_1 = L3_1
            L17_1 = string
            L17_1 = L17_1.lower
            L18_1 = L14_1.Path
            L17_1 = L17_1(L18_1)
            L18_1 = 1
            L19_1 = true
            L15_1 = L15_1(L16_1, L17_1, L18_1, L19_1)
            if L15_1 then
              L15_1 = mp
              L15_1 = L15_1.set_mpattribute
              L16_1 = "MpDisableCaching"
              L15_1(L16_1)
              L15_1 = MpCommon
              L15_1 = L15_1.GetPersistContextCount
              L16_1 = L3_1
              L15_1 = L15_1(L16_1)
              if L15_1 == 0 then
                L15_1 = {}
                L16_1 = table
                L16_1 = L16_1.insert
                L17_1 = L15_1
                L18_1 = L1_1
                L16_1(L17_1, L18_1)
                L16_1 = MpCommon
                L16_1 = L16_1.SetPersistContext
                L17_1 = L3_1
                L18_1 = L15_1
                L19_1 = 0
                L16_1(L17_1, L18_1, L19_1)
              else
                L15_1 = MpCommon
                L15_1 = L15_1.QueryPersistContext
                L16_1 = L3_1
                L17_1 = L1_1
                L15_1 = L15_1(L16_1, L17_1)
                if not L15_1 then
                  L15_1 = MpCommon
                  L15_1 = L15_1.AppendPersistContext
                  L16_1 = L3_1
                  L17_1 = L1_1
                  L18_1 = 0
                  L15_1(L16_1, L17_1, L18_1)
                end
              end
              L15_1 = mp
              L15_1 = L15_1.SetHipsRule
              L16_1 = "a8f5898e-1dc8-49a9-9878-85004b8a61e6"
              L15_1(L16_1)
              L15_1 = mp
              L15_1 = L15_1.BLOCKACCESS
              return L15_1
            end
          end
        end
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
