local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = peattributes
L0_1 = L0_1.isexe
if L0_1 == true then
  L0_1 = peattributes
  L0_1 = L0_1.isdll
  if L0_1 ~= true then
    L0_1 = peattributes
    L0_1 = L0_1.isdriver
    if L0_1 ~= true then
      goto lbl_16
    end
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
L1_1 = L1_1.getfilename
L1_1 = L1_1()
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_PROCESSNAME
L2_1 = L2_1(L3_1)
if L2_1 == nil then
  L3_1 = ""
  if L3_1 then
    goto lbl_51
  end
end
L3_1 = L2_1
::lbl_51::
L4_1 = L3_1
L3_1 = L3_1.lower
L3_1 = L3_1(L4_1)
L2_1 = L3_1
L3_1 = "contextualpersistdropnewexepe"
L4_1 = {}
L4_1["7zfm.exe"] = true
L4_1["bitsadmin.exe"] = true
L4_1["cmd.exe"] = true
L4_1["cscript.exe"] = true
L4_1["excel.exe"] = true
L4_1["explorer.exe"] = true
L4_1["mshta.exe"] = true
L4_1["outlook.exe"] = true
L4_1["powerpnt.exe"] = true
L4_1["winrar.exe"] = true
L4_1["winword.exe"] = true
L4_1["winzip32.exe"] = true
L4_1["winzip64.exe"] = true
L4_1["wscript.exe"] = true
L4_1["slack.exe"] = true
L4_1["firefox.exe"] = true
L4_1["skypeapp.exe"] = true
L4_1["skypehost.exe"] = true
L4_1["teams.exe"] = true
L5_1 = mp
L5_1 = L5_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 == L5_1 then
  L5_1 = mp
  L5_1 = L5_1.get_contextdata
  L6_1 = mp
  L6_1 = L6_1.CONTEXT_DATA_NEWLYCREATEDHINT
  L5_1 = L5_1(L6_1)
  if not L5_1 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = L4_1[L2_1]
  if L5_1 ~= true then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = MpCommon
  L5_1 = L5_1.PathToWin32Path
  L6_1 = mp
  L6_1 = L6_1.get_contextdata
  L7_1 = mp
  L7_1 = L7_1.CONTEXT_DATA_FILEPATH
  L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L6_1(L7_1)
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
  if L5_1 == nil then
    L6_1 = ""
    if L6_1 then
      goto lbl_109
    end
  end
  L6_1 = L5_1
  ::lbl_109::
  L7_1 = L6_1
  L6_1 = L6_1.lower
  L6_1 = L6_1(L7_1)
  L5_1 = L6_1
  L6_1 = mp
  L6_1 = L6_1.ContextualExpandEnvironmentVariables
  L7_1 = "%temp%"
  L6_1 = L6_1(L7_1)
  if L6_1 == nil then
    L7_1 = ""
    if L7_1 then
      goto lbl_122
    end
  end
  L7_1 = L6_1
  ::lbl_122::
  L8_1 = L7_1
  L7_1 = L7_1.lower
  L7_1 = L7_1(L8_1)
  L6_1 = L7_1
  L7_1 = mp
  L7_1 = L7_1.ContextualExpandEnvironmentVariables
  L8_1 = "%appdata%"
  L7_1 = L7_1(L8_1)
  if L7_1 == nil then
    L8_1 = ""
    if L8_1 then
      goto lbl_135
    end
  end
  L8_1 = L7_1
  ::lbl_135::
  L9_1 = L8_1
  L8_1 = L8_1.lower
  L8_1 = L8_1(L9_1)
  L7_1 = L8_1
  L8_1 = mp
  L8_1 = L8_1.ContextualExpandEnvironmentVariables
  L9_1 = "%localappdata%"
  L8_1 = L8_1(L9_1)
  if L8_1 == nil then
    L9_1 = ""
    if L9_1 then
      goto lbl_148
    end
  end
  L9_1 = L8_1
  ::lbl_148::
  L10_1 = L9_1
  L9_1 = L9_1.lower
  L9_1 = L9_1(L10_1)
  L8_1 = L9_1
  L9_1 = mp
  L9_1 = L9_1.ContextualExpandEnvironmentVariables
  L10_1 = "%userprofile%"
  L9_1 = L9_1(L10_1)
  if L9_1 == nil then
    L10_1 = ""
    if L10_1 then
      goto lbl_161
    end
  end
  L10_1 = L9_1
  ::lbl_161::
  L11_1 = L10_1
  L10_1 = L10_1.lower
  L10_1 = L10_1(L11_1)
  L9_1 = L10_1
  L11_1 = L5_1
  L10_1 = L5_1.find
  L12_1 = L6_1
  L13_1 = 1
  L14_1 = true
  L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
  if L10_1 == nil then
    L11_1 = L5_1
    L10_1 = L5_1.find
    L12_1 = L7_1
    L13_1 = 1
    L14_1 = true
    L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
    if L10_1 == nil then
      L11_1 = L5_1
      L10_1 = L5_1.find
      L12_1 = L9_1
      L13_1 = 1
      L14_1 = true
      L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
      if L10_1 == nil then
        L11_1 = L5_1
        L10_1 = L5_1.find
        L12_1 = L8_1
        L13_1 = 1
        L14_1 = true
        L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
        if L10_1 == nil then
          L10_1 = mp
          L10_1 = L10_1.CLEAN
          return L10_1
        end
      end
    end
  end
  L10_1 = MpCommon
  L10_1 = L10_1.QueryPersistContext
  L11_1 = L1_1
  L12_1 = L3_1
  L10_1 = L10_1(L11_1, L12_1)
  if not L10_1 then
    L10_1 = MpCommon
    L10_1 = L10_1.AppendPersistContext
    L11_1 = L1_1
    L12_1 = L3_1
    L13_1 = 30
    L10_1(L11_1, L12_1, L13_1)
    L10_1 = mp
    L10_1 = L10_1.set_mpattribute
    L11_1 = "MpDisableCaching"
    L10_1(L11_1)
  end
else
  L5_1 = mp
  L5_1 = L5_1.SCANREASON_ONOPEN
  if L0_1 == L5_1 then
    L5_1 = MpCommon
    L5_1 = L5_1.QueryPersistContext
    L6_1 = L1_1
    L7_1 = L3_1
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 then
      L5_1 = mp
      L5_1 = L5_1.get_contextdata
      L6_1 = mp
      L6_1 = L6_1.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT
      L5_1 = L5_1(L6_1)
      if L5_1 then
        L5_1 = L4_1[L2_1]
        if L5_1 == true then
          L5_1 = mp
          L5_1 = L5_1.INFECTED
          return L5_1
        end
      end
      L5_1 = mp
      L5_1 = L5_1.set_mpattribute
      L6_1 = "MpDisableCaching"
      L5_1(L6_1)
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
