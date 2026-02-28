local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "SCPT:Trojan:JS/WmiScriptingEngineParams.A!ams"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "SCPT:Trojan:JS/WmiScriptingEngineParams.B!ams"
  L0_1 = L0_1(L1_1)
  if L0_1 then
    goto lbl_16
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_16::
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_AMSI
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.IsHipsRuleEnabled
L1_1 = "e6db77e5-3df2-4cf1-b95a-636979351e5b"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = false
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_AMSI_CONTENTNAME
L1_1 = L1_1(L2_1)
if L1_1 ~= nil and L1_1 ~= "" then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
  L2_1 = #L1_1
  if 10 < L2_1 then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L1_1
    L4_1 = "^memscanvfz"
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 == nil then
      goto lbl_65
    end
  end
  L2_1 = #L1_1
  ::lbl_65::
  if L2_1 <= 10 then
    L2_1 = #L1_1
    if 7 < L2_1 then
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L1_1
      L4_1 = "^\\device\\"
      L2_1 = L2_1(L3_1, L4_1)
      if L2_1 ~= nil then
        L2_1 = string
        L2_1 = L2_1.lower
        L3_1 = MpCommon
        L3_1 = L3_1.PathToWin32Path
        L4_1 = L1_1
        L3_1, L4_1, L5_1 = L3_1(L4_1)
        L2_1 = L2_1(L3_1, L4_1, L5_1)
        L1_1 = L2_1
      end
    end
    L2_1 = sysio
    L2_1 = L2_1.IsFileExists
    L3_1 = L1_1
    L2_1 = L2_1(L3_1)
    if L2_1 then
      L0_1 = true
    end
  end
end
if L0_1 == false then
  L2_1 = mp
  L2_1 = L2_1.getfilename
  L3_1 = mp
  L3_1 = L3_1.bitor
  L4_1 = mp
  L4_1 = L4_1.FILEPATH_QUERY_FULL
  L5_1 = mp
  L5_1 = L5_1.FILEPATH_QUERY_LOWERCASE
  L3_1, L4_1, L5_1 = L3_1(L4_1, L5_1)
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  L1_1 = L2_1
  if L1_1 ~= nil and L1_1 ~= "" then
    L2_1 = #L1_1
    if 10 < L2_1 then
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L1_1
      L4_1 = "^memscanvfz"
      L2_1 = L2_1(L3_1, L4_1)
      if L2_1 == nil then
        goto lbl_120
      end
    end
    L2_1 = #L1_1
    ::lbl_120::
    if L2_1 <= 10 then
      L2_1 = #L1_1
      if 7 < L2_1 then
        L2_1 = string
        L2_1 = L2_1.find
        L3_1 = L1_1
        L4_1 = "^\\device\\"
        L2_1 = L2_1(L3_1, L4_1)
        if L2_1 ~= nil then
          L2_1 = string
          L2_1 = L2_1.lower
          L3_1 = MpCommon
          L3_1 = L3_1.PathToWin32Path
          L4_1 = L1_1
          L3_1, L4_1, L5_1 = L3_1(L4_1)
          L2_1 = L2_1(L3_1, L4_1, L5_1)
          L1_1 = L2_1
        end
      end
      L2_1 = sysio
      L2_1 = L2_1.IsFileExists
      L3_1 = L1_1
      L2_1 = L2_1(L3_1)
      if L2_1 then
        L0_1 = true
      end
    end
  end
end
if L0_1 then
  L2_1 = mp
  L2_1 = L2_1.IsPathExcludedForHipsRule
  L3_1 = L1_1
  L4_1 = "e6db77e5-3df2-4cf1-b95a-636979351e5b"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
end
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "%a:\\sccm_cache\\prestg\\[%d%.]+\\microsoft%-corporation_postoobe\\.+%.ps1$"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
