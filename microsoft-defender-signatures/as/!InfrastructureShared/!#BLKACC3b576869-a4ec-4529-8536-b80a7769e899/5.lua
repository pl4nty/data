local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = mp
L0_1 = L0_1.IsHipsRuleEnabled
L1_1 = "3b576869-a4ec-4529-8536-b80a7769e899"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = GetCtxOfficeProc
L0_1 = L0_1()
if L0_1 ~= "productivity" then
  L0_1 = MpCommon
  L0_1 = L0_1.GetPersistContextCountNoPath
  L1_1 = "BlockOfficeCreateExecContentProcs"
  L0_1 = L0_1(L1_1)
  if L0_1 == 0 then
    L0_1 = mp
    L0_1 = L0_1.CLEAN
    return L0_1
  end
  L0_1 = mp
  L0_1 = L0_1.get_contextdata
  L1_1 = mp
  L1_1 = L1_1.CONTEXT_DATA_PROCESS_PPID
  L0_1 = L0_1(L1_1)
  if L0_1 == "" or L0_1 == nil then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = mp
  L2_1 = L2_1.get_contextdata
  L3_1 = mp
  L3_1 = L3_1.CONTEXT_DATA_PROCESSNAME
  L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1 = L2_1(L3_1)
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
  if L1_1 == "" or L1_1 == nil then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L2_1 = L1_1
  L3_1 = "+"
  L4_1 = L0_1
  L2_1 = L2_1 .. L3_1 .. L4_1
  L3_1 = MpCommon
  L3_1 = L3_1.QueryPersistContextNoPath
  L4_1 = "BlockOfficeCreateExecContentProcs"
  L5_1 = L2_1
  L3_1 = L3_1(L4_1, L5_1)
  if not L3_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end
L0_1 = peattributes
L0_1 = L0_1.isexe
if not L0_1 then
  L0_1 = peattributes
  L0_1 = L0_1.isdll
  if not L0_1 then
    L0_1 = peattributes
    L0_1 = L0_1.isdriver
    if not L0_1 then
      L0_1 = mp
      L0_1 = L0_1.CLEAN
      return L0_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.IsTrustedFile
L1_1 = false
L0_1, L1_1 = L0_1(L1_1)
if L0_1 == true then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
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
L3_1 = MpCommon
L3_1 = L3_1.PathToWin32Path
L4_1 = mp
L4_1 = L4_1.get_contextdata
L5_1 = mp
L5_1 = L5_1.CONTEXT_DATA_FILEPATH
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1 = L4_1(L5_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
if L3_1 == nil or L3_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.lower
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L3_1 = L4_1
L4_1 = L3_1
L5_1 = "\\"
L6_1 = L2_1
L4_1 = L4_1 .. L5_1 .. L6_1
L5_1 = string
L5_1 = L5_1.lower
L6_1 = mp
L6_1 = L6_1.ContextualExpandEnvironmentVariables
L7_1 = "%userprofile%"
L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1 = L6_1(L7_1)
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
L6_1 = nil
if L5_1 ~= nil and L5_1 ~= "" then
  L7_1 = string
  L7_1 = L7_1.match
  L8_1 = L5_1
  L9_1 = "(%a:.*\\)[^\\]+$"
  L7_1 = L7_1(L8_1, L9_1)
  L6_1 = L7_1
end
L7_1 = MpCommon
L7_1 = L7_1.ExpandEnvironmentVariables
L8_1 = "%programfiles%"
L7_1 = L7_1(L8_1)
if L7_1 == nil then
  L8_1 = ""
  if L8_1 then
    goto lbl_169
  end
end
L8_1 = L7_1
::lbl_169::
L9_1 = L8_1
L8_1 = L8_1.lower
L8_1 = L8_1(L9_1)
L7_1 = L8_1
L8_1 = MpCommon
L8_1 = L8_1.ExpandEnvironmentVariables
L9_1 = "%programfiles(x86)%"
L8_1 = L8_1(L9_1)
if L8_1 == nil then
  L9_1 = ""
  if L9_1 then
    goto lbl_182
  end
end
L9_1 = L8_1
::lbl_182::
L10_1 = L9_1
L9_1 = L9_1.lower
L9_1 = L9_1(L10_1)
L8_1 = L9_1
L9_1 = MpCommon
L9_1 = L9_1.ExpandEnvironmentVariables
L10_1 = "%commonprogramfiles%"
L9_1 = L9_1(L10_1)
if L9_1 == nil then
  L10_1 = ""
  if L10_1 then
    goto lbl_195
  end
end
L10_1 = L9_1
::lbl_195::
L11_1 = L10_1
L10_1 = L10_1.lower
L10_1 = L10_1(L11_1)
L9_1 = L10_1
L10_1 = MpCommon
L10_1 = L10_1.ExpandEnvironmentVariables
L11_1 = "%commonprogramfiles(x86)%"
L10_1 = L10_1(L11_1)
if L10_1 == nil then
  L11_1 = ""
  if L11_1 then
    goto lbl_208
  end
end
L11_1 = L10_1
::lbl_208::
L12_1 = L11_1
L11_1 = L11_1.lower
L11_1 = L11_1(L12_1)
L10_1 = L11_1
L11_1 = MpCommon
L11_1 = L11_1.ExpandEnvironmentVariables
L12_1 = "%systemdrive%"
L11_1 = L11_1(L12_1)
if L11_1 == nil then
  L12_1 = ""
  if L12_1 then
    goto lbl_221
  end
end
L12_1 = L11_1
::lbl_221::
L13_1 = L12_1
L12_1 = L12_1.lower
L12_1 = L12_1(L13_1)
L11_1 = L12_1
L12_1 = MpCommon
L12_1 = L12_1.ExpandEnvironmentVariables
L13_1 = "%systemroot%"
L12_1 = L12_1(L13_1)
if L12_1 == nil then
  L13_1 = ""
  if L13_1 then
    goto lbl_234
  end
end
L13_1 = L12_1
::lbl_234::
L14_1 = L13_1
L13_1 = L13_1.lower
L13_1 = L13_1(L14_1)
L12_1 = L13_1
if L6_1 ~= nil and L6_1 ~= "" then
  L14_1 = L3_1
  L13_1 = L3_1.find
  L15_1 = L6_1
  L16_1 = "[^\\]+\\appdata\\local\\low\\sogoupy"
  L15_1 = L15_1 .. L16_1
  L13_1 = L13_1(L14_1, L15_1)
  if L13_1 ~= nil then
    L13_1 = mp
    L13_1 = L13_1.CLEAN
    return L13_1
  end
  L14_1 = L3_1
  L13_1 = L3_1.find
  L15_1 = L6_1
  L16_1 = "[^\\]+\\appdata\\roaming\\locallow\\sogoupy"
  L15_1 = L15_1 .. L16_1
  L13_1 = L13_1(L14_1, L15_1)
  if L13_1 ~= nil then
    L13_1 = mp
    L13_1 = L13_1.CLEAN
    return L13_1
  end
  L14_1 = L3_1
  L13_1 = L3_1.find
  L15_1 = L6_1
  L16_1 = "[^\\]+\\appdata\\roaming\\onetastic"
  L15_1 = L15_1 .. L16_1
  L13_1 = L13_1(L14_1, L15_1)
  if L13_1 ~= nil then
    L13_1 = mp
    L13_1 = L13_1.CLEAN
    return L13_1
  end
  L14_1 = L3_1
  L13_1 = L3_1.find
  L15_1 = L6_1
  L16_1 = "[^\\]+\\appdata\\local\\temp\\onenotesyncdata"
  L15_1 = L15_1 .. L16_1
  L13_1 = L13_1(L14_1, L15_1)
  if L13_1 ~= nil then
    L13_1 = mp
    L13_1 = L13_1.CLEAN
    return L13_1
  end
  L14_1 = L3_1
  L13_1 = L3_1.find
  L15_1 = L6_1
  L16_1 = "[^\\]+\\appdata\\local\\temp\\onenotesyncdata\\"
  L15_1 = L15_1 .. L16_1
  L13_1 = L13_1(L14_1, L15_1)
  if L13_1 ~= nil then
    L13_1 = mp
    L13_1 = L13_1.CLEAN
    return L13_1
  end
  L14_1 = L3_1
  L13_1 = L3_1.find
  L15_1 = L6_1
  L16_1 = "[^\\]+\\appdata\\local\\assembly\\"
  L15_1 = L15_1 .. L16_1
  L13_1 = L13_1(L14_1, L15_1)
  if L13_1 ~= nil then
    L13_1 = mp
    L13_1 = L13_1.CLEAN
    return L13_1
  end
  L14_1 = L3_1
  L13_1 = L3_1.find
  L15_1 = L6_1
  L16_1 = "[^\\]+\\appdata\\local\\microsoft\\windows\\inetcache\\"
  L15_1 = L15_1 .. L16_1
  L13_1 = L13_1(L14_1, L15_1)
  if L13_1 ~= nil then
    L13_1 = mp
    L13_1 = L13_1.CLEAN
    return L13_1
  end
  L14_1 = L4_1
  L13_1 = L4_1.find
  L15_1 = L6_1
  L16_1 = "[^\\]+\\appdata\\local\\microsoft\\onenote%d*\\%d+%.%d+\\cache\\.+%.%a*bin$"
  L15_1 = L15_1 .. L16_1
  L13_1 = L13_1(L14_1, L15_1)
  if L13_1 ~= nil then
    L13_1 = mp
    L13_1 = L13_1.CLEAN
    return L13_1
  end
  L14_1 = L4_1
  L13_1 = L4_1.find
  L15_1 = L6_1
  L16_1 = "[^\\]+\\appdata\\local\\microsoft\\onenote%d*\\%d+%.%d+\\cache\\tmp\\.+%.%a*bin$"
  L15_1 = L15_1 .. L16_1
  L13_1 = L13_1(L14_1, L15_1)
  if L13_1 ~= nil then
    L13_1 = mp
    L13_1 = L13_1.CLEAN
    return L13_1
  end
  L14_1 = L4_1
  L13_1 = L4_1.find
  L15_1 = L6_1
  L16_1 = "[^\\]+\\appdata\\local\\microsoft\\msoidentitycrl\\production\\[^\\]+%.dll$"
  L15_1 = L15_1 .. L16_1
  L13_1 = L13_1(L14_1, L15_1)
  if L13_1 ~= nil then
    L13_1 = mp
    L13_1 = L13_1.CLEAN
    return L13_1
  end
  L14_1 = L4_1
  L13_1 = L4_1.find
  L15_1 = L6_1
  L16_1 = "[^\\]+\\appdata\\local\\microsoft\\uev\\.+%.pkgdat$"
  L15_1 = L15_1 .. L16_1
  L13_1 = L13_1(L14_1, L15_1)
  if L13_1 ~= nil then
    L13_1 = mp
    L13_1 = L13_1.CLEAN
    return L13_1
  end
  L14_1 = L3_1
  L13_1 = L3_1.find
  L15_1 = L6_1
  L16_1 = "[^\\]+\\appdata\\local\\microsoft\\appv\\client\\vfs\\[a-f0-9]+-[a-f0-9]+-[a-f0-9]+-[a-f0-9]+-[a-f0-9]+\\"
  L15_1 = L15_1 .. L16_1
  L13_1 = L13_1(L14_1, L15_1)
  if L13_1 ~= nil then
    L13_1 = mp
    L13_1 = L13_1.CLEAN
    return L13_1
  end
  L14_1 = L4_1
  L13_1 = L4_1.find
  L15_1 = L6_1
  L16_1 = "[^\\]+\\appdata\\local\\microsoft\\onedrive\\%d+%.%d+%.%d+%.%d+\\.+%.dll.*$"
  L15_1 = L15_1 .. L16_1
  L13_1 = L13_1(L14_1, L15_1)
  if L13_1 ~= nil then
    L13_1 = mp
    L13_1 = L13_1.CLEAN
    return L13_1
  end
  L14_1 = L4_1
  L13_1 = L4_1.find
  L15_1 = L6_1
  L16_1 = "[^\\]+\\appdata\\local\\microsoft\\windows\\temporary internet files\\content.ie5\\.+%.dll$"
  L15_1 = L15_1 .. L16_1
  L13_1 = L13_1(L14_1, L15_1)
  if L13_1 ~= nil then
    L13_1 = mp
    L13_1 = L13_1.CLEAN
    return L13_1
  end
  L14_1 = L4_1
  L13_1 = L4_1.find
  L15_1 = L6_1
  L16_1 = "[^\\]+\\appdata\\local\\microsoft\\teams\\current\\.+%.dll$"
  L15_1 = L15_1 .. L16_1
  L13_1 = L13_1(L14_1, L15_1)
  if L13_1 ~= nil then
    L13_1 = mp
    L13_1 = L13_1.CLEAN
    return L13_1
  end
  L14_1 = L3_1
  L13_1 = L3_1.find
  L15_1 = L6_1
  L16_1 = "[^\\]+\\appdata\\local\\temp\\deployment\\"
  L15_1 = L15_1 .. L16_1
  L13_1 = L13_1(L14_1, L15_1)
  if L13_1 ~= nil then
    L13_1 = mp
    L13_1 = L13_1.CLEAN
    return L13_1
  end
  L14_1 = L3_1
  L13_1 = L3_1.find
  L15_1 = L6_1
  L16_1 = "[^\\]+\\appdata\\local\\temp\\onenotesyncdata\\"
  L15_1 = L15_1 .. L16_1
  L13_1 = L13_1(L14_1, L15_1)
  if L13_1 ~= nil then
    L13_1 = mp
    L13_1 = L13_1.CLEAN
    return L13_1
  end
  L14_1 = L3_1
  L13_1 = L3_1.find
  L15_1 = L6_1
  L16_1 = "[^\\]+\\appdata\\local\\mssolvehelper databroker\\"
  L15_1 = L15_1 .. L16_1
  L13_1 = L13_1(L14_1, L15_1)
  if L13_1 ~= nil then
    L13_1 = mp
    L13_1 = L13_1.CLEAN
    return L13_1
  end
  L14_1 = L3_1
  L13_1 = L3_1.find
  L15_1 = L6_1
  L16_1 = "[^\\]+\\appdata\\local\\temp\\deployment\\"
  L15_1 = L15_1 .. L16_1
  L13_1 = L13_1(L14_1, L15_1)
  if L13_1 ~= nil then
    L13_1 = mp
    L13_1 = L13_1.CLEAN
    return L13_1
  end
  L14_1 = L3_1
  L13_1 = L3_1.find
  L15_1 = L6_1
  L16_1 = "[^\\]+\\appdata\\local\\temp\\onenotesyncdata\\"
  L15_1 = L15_1 .. L16_1
  L13_1 = L13_1(L14_1, L15_1)
  if L13_1 ~= nil then
    L13_1 = mp
    L13_1 = L13_1.CLEAN
    return L13_1
  end
  L14_1 = L3_1
  L13_1 = L3_1.find
  L15_1 = L6_1
  L16_1 = "[^\\]+\\appdata\\local\\temp\\officemix.setup."
  L15_1 = L15_1 .. L16_1
  L13_1 = L13_1(L14_1, L15_1)
  if L13_1 ~= nil then
    L13_1 = mp
    L13_1 = L13_1.CLEAN
    return L13_1
  end
  L14_1 = L3_1
  L13_1 = L3_1.find
  L15_1 = L6_1
  L16_1 = "[^\\]+\\appdata\\local"
  L15_1 = L15_1 .. L16_1
  L13_1 = L13_1(L14_1, L15_1)
  if L13_1 ~= nil then
    L14_1 = L3_1
    L13_1 = L3_1.find
    L15_1 = "\\apps\\%d%.%d\\%w%w%w%w%w%w%w%w%.%w%w%w\\%w%w%w%w%w%w%w%w%.%w%w%w\\"
    L13_1 = L13_1(L14_1, L15_1)
    if L13_1 ~= nil then
      L13_1 = mp
      L13_1 = L13_1.CLEAN
      return L13_1
    end
  end
  L14_1 = L3_1
  L13_1 = L3_1.find
  L15_1 = L6_1
  L16_1 = "[^\\]+\\appdata\\local\\temp"
  L15_1 = L15_1 .. L16_1
  L13_1 = L13_1(L14_1, L15_1)
  if L13_1 ~= nil then
    L14_1 = L2_1
    L13_1 = L2_1.match
    L15_1 = "^{%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x}$"
    L13_1 = L13_1(L14_1, L15_1)
    if L13_1 then
      L13_1 = mp
      L13_1 = L13_1.CLEAN
      return L13_1
    end
  end
end
L14_1 = L3_1
L13_1 = L3_1.find
L15_1 = L7_1
L16_1 = "\\microsoft office\\"
L15_1 = L15_1 .. L16_1
L16_1 = 1
L17_1 = true
L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
if L13_1 ~= nil then
  L13_1 = mp
  L13_1 = L13_1.CLEAN
  return L13_1
end
L14_1 = L3_1
L13_1 = L3_1.find
L15_1 = L9_1
L16_1 = "\\microsoft shared\\"
L15_1 = L15_1 .. L16_1
L16_1 = 1
L17_1 = true
L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
if L13_1 ~= nil then
  L13_1 = mp
  L13_1 = L13_1.CLEAN
  return L13_1
end
L13_1 = L7_1
L14_1 = "\\microsoft azure information protection\\"
L13_1 = L13_1 .. L14_1
if L3_1 == L13_1 then
  L13_1 = mp
  L13_1 = L13_1.CLEAN
  return L13_1
end
L14_1 = L3_1
L13_1 = L3_1.find
L15_1 = L8_1
L16_1 = "\\microsoft office\\"
L15_1 = L15_1 .. L16_1
L16_1 = 1
L17_1 = true
L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
if L13_1 ~= nil then
  L13_1 = mp
  L13_1 = L13_1.CLEAN
  return L13_1
end
L14_1 = L3_1
L13_1 = L3_1.find
L15_1 = L10_1
L16_1 = "\\microsoft shared\\"
L15_1 = L15_1 .. L16_1
L16_1 = 1
L17_1 = true
L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
if L13_1 ~= nil then
  L13_1 = mp
  L13_1 = L13_1.CLEAN
  return L13_1
end
L13_1 = L8_1
L14_1 = "\\microsoft azure information protection\\"
L13_1 = L13_1 .. L14_1
if L3_1 == L13_1 then
  L13_1 = mp
  L13_1 = L13_1.CLEAN
  return L13_1
end
L13_1 = L11_1
L14_1 = "\\gendox\\teams\\common\\bin"
L13_1 = L13_1 .. L14_1
if L3_1 == L13_1 then
  L13_1 = mp
  L13_1 = L13_1.CLEAN
  return L13_1
end
L14_1 = L3_1
L13_1 = L3_1.find
L15_1 = L12_1
L16_1 = "\\assembly\\"
L15_1 = L15_1 .. L16_1
L16_1 = 1
L17_1 = true
L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
if L13_1 ~= nil then
  L13_1 = mp
  L13_1 = L13_1.CLEAN
  return L13_1
end
L13_1 = mp
L13_1 = L13_1.get_mpattribute
L14_1 = "Lua:SignedThinkCellComponent"
L13_1 = L13_1(L14_1)
if L13_1 then
  L13_1 = mp
  L13_1 = L13_1.CLEAN
  return L13_1
end
L13_1 = mp
L13_1 = L13_1.IsPathExcludedForHipsRule
L14_1 = L4_1
L15_1 = "3b576869-a4ec-4529-8536-b80a7769e899"
L13_1 = L13_1(L14_1, L15_1)
if L13_1 then
  L13_1 = mp
  L13_1 = L13_1.CLEAN
  return L13_1
end
L13_1 = peattributes
L13_1 = L13_1.isdll
if L13_1 then
  L13_1 = mp
  L13_1 = L13_1.get_mpattribute
  L14_1 = "SOAPSchema.A"
  L13_1 = L13_1(L14_1)
  if L13_1 then
    L13_1 = mp
    L13_1 = L13_1.CLEAN
    return L13_1
  end
end
L13_1 = mp
L13_1 = L13_1.set_mpattribute
L14_1 = "MpDisableCaching"
L13_1(L14_1)
L13_1 = mp
L13_1 = L13_1.INFECTED
return L13_1
