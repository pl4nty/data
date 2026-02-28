local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
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
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_NEWLYCREATEDHINT
L0_1 = L0_1(L1_1)
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = GetCtxOfficeProc
L0_1 = L0_1()
if L0_1 ~= "productivity2" then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = {}
L0_1[".bat"] = true
L0_1[".cmd"] = true
L0_1[".com"] = true
L0_1[".dll"] = true
L0_1[".exe"] = true
L0_1[".hta"] = true
L0_1[".jar"] = true
L0_1[".js"] = true
L0_1[".jse"] = true
L0_1[".lnk"] = true
L0_1[".ocx"] = true
L0_1[".pif"] = true
L0_1[".ps1"] = true
L0_1[".psc1"] = true
L0_1[".scr"] = true
L0_1[".sys"] = true
L0_1[".vbe"] = true
L0_1[".vbs"] = true
L0_1[".wsc"] = true
L0_1[".wsf"] = true
L0_1[".wsh"] = true
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_FILENAME
L1_1 = L1_1(L2_1)
if L1_1 == nil then
  L2_1 = ""
  if L2_1 then
    goto lbl_63
  end
end
L2_1 = L1_1
::lbl_63::
L3_1 = L2_1
L2_1 = L2_1.lower
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L3_1 = L1_1
L2_1 = L1_1.sub
L4_1 = -5
L2_1 = L2_1(L3_1, L4_1)
L3_1 = L2_1
L2_1 = L2_1.match
L4_1 = "(%.%w+)$"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L3_1 = ""
  L2_1 = L3_1 or L2_1
  if not L3_1 then
  end
end
L3_1 = L0_1[L2_1]
if L3_1 ~= true then
  L3_1 = mp
  L3_1 = L3_1.getfilename
  L3_1 = L3_1()
  L4_1 = MpCommon
  L4_1 = L4_1.GetPersistContext
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  if L4_1 then
    L5_1 = table
    L5_1 = L5_1.insert
    L6_1 = L4_1
    L7_1 = "contextualofficecreaterunnablecontent"
    L5_1(L6_1, L7_1)
  else
    L5_1 = {}
    L6_1 = "contextualofficecreaterunnablecontent"
    L5_1[1] = L6_1
    L4_1 = L5_1
  end
  L5_1 = MpCommon
  L5_1 = L5_1.SetPersistContext
  L6_1 = L3_1
  L7_1 = L4_1
  L8_1 = 0
  L5_1(L6_1, L7_1, L8_1)
  L5_1 = mp
  L5_1 = L5_1.set_mpattribute
  L6_1 = "MpDisableCaching"
  L5_1(L6_1)
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L3_1 = MpCommon
L3_1 = L3_1.PathToWin32Path
L4_1 = mp
L4_1 = L4_1.get_contextdata
L5_1 = mp
L5_1 = L5_1.CONTEXT_DATA_FILEPATH
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1 = L4_1(L5_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
if L3_1 == nil then
  L4_1 = ""
  if L4_1 then
    goto lbl_126
  end
end
L4_1 = L3_1
::lbl_126::
L5_1 = L4_1
L4_1 = L4_1.lower
L4_1 = L4_1(L5_1)
L3_1 = L4_1
L4_1 = mp
L4_1 = L4_1.ContextualExpandEnvironmentVariables
L5_1 = "%appdata%"
L4_1 = L4_1(L5_1)
if L4_1 == nil then
  L5_1 = ""
  if L5_1 then
    goto lbl_139
  end
end
L5_1 = L4_1
::lbl_139::
L6_1 = L5_1
L5_1 = L5_1.lower
L5_1 = L5_1(L6_1)
L4_1 = L5_1
L5_1 = mp
L5_1 = L5_1.ContextualExpandEnvironmentVariables
L6_1 = "%localappdata%"
L5_1 = L5_1(L6_1)
if L5_1 == nil then
  L6_1 = ""
  if L6_1 then
    goto lbl_152
  end
end
L6_1 = L5_1
::lbl_152::
L7_1 = L6_1
L6_1 = L6_1.lower
L6_1 = L6_1(L7_1)
L5_1 = L6_1
L6_1 = MpCommon
L6_1 = L6_1.ExpandEnvironmentVariables
L7_1 = "%systemdrive%"
L6_1 = L6_1(L7_1)
if L6_1 == nil then
  L7_1 = ""
  if L7_1 then
    goto lbl_165
  end
end
L7_1 = L6_1
::lbl_165::
L8_1 = L7_1
L7_1 = L7_1.lower
L7_1 = L7_1(L8_1)
L6_1 = L7_1
L7_1 = MpCommon
L7_1 = L7_1.ExpandEnvironmentVariables
L8_1 = "%systemroot%"
L7_1 = L7_1(L8_1)
if L7_1 == nil then
  L8_1 = ""
  if L8_1 then
    goto lbl_178
  end
end
L8_1 = L7_1
::lbl_178::
L9_1 = L8_1
L8_1 = L8_1.lower
L8_1 = L8_1(L9_1)
L7_1 = L8_1
if L2_1 == ".lnk" then
  L9_1 = L3_1
  L8_1 = L3_1.find
  L10_1 = L4_1
  L11_1 = "\\microsoft\\office\\"
  L10_1 = L10_1 .. L11_1
  L11_1 = 1
  L12_1 = true
  L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
  if L8_1 ~= nil then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
  L9_1 = L3_1
  L8_1 = L3_1.find
  L10_1 = L4_1
  L11_1 = "\\microsoft\\excel\\"
  L10_1 = L10_1 .. L11_1
  L11_1 = 1
  L12_1 = true
  L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
  if L8_1 ~= nil then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
  L9_1 = L3_1
  L8_1 = L3_1.find
  L10_1 = L4_1
  L11_1 = "\\microsoft\\onenote\\"
  L10_1 = L10_1 .. L11_1
  L11_1 = 1
  L12_1 = true
  L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
  if L8_1 ~= nil then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
  L9_1 = L3_1
  L8_1 = L3_1.find
  L10_1 = L4_1
  L11_1 = "\\microsoft\\outlook\\"
  L10_1 = L10_1 .. L11_1
  L11_1 = 1
  L12_1 = true
  L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
  if L8_1 ~= nil then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
  L9_1 = L3_1
  L8_1 = L3_1.find
  L10_1 = L4_1
  L11_1 = "\\microsoft\\powerpoint\\"
  L10_1 = L10_1 .. L11_1
  L11_1 = 1
  L12_1 = true
  L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
  if L8_1 ~= nil then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
  L9_1 = L3_1
  L8_1 = L3_1.find
  L10_1 = L4_1
  L11_1 = "\\microsoft\\word\\"
  L10_1 = L10_1 .. L11_1
  L11_1 = 1
  L12_1 = true
  L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
  if L8_1 ~= nil then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
  L9_1 = L3_1
  L8_1 = L3_1.find
  L10_1 = L4_1
  L11_1 = "\\microsoft\\internet explorer\\quick launch"
  L10_1 = L10_1 .. L11_1
  L11_1 = 1
  L12_1 = true
  L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
  if L8_1 ~= nil then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
  L8_1 = L4_1
  L9_1 = "\\microsoft\\windows\\start menu\\programs\\startup"
  L8_1 = L8_1 .. L9_1
  if L3_1 == L8_1 and L1_1 == "send to onenote.lnk" then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
  L9_1 = L3_1
  L8_1 = L3_1.find
  L10_1 = L5_1
  L11_1 = "\\invincea\\enterprise\\"
  L10_1 = L10_1 .. L11_1
  L11_1 = 1
  L12_1 = true
  L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
  if L8_1 ~= nil then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
  L9_1 = L3_1
  L8_1 = L3_1.find
  L10_1 = L6_1
  L11_1 = "\\appsensevirtual\\"
  L10_1 = L10_1 .. L11_1
  L11_1 = 1
  L12_1 = true
  L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
  if L8_1 ~= nil then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
  L9_1 = L3_1
  L8_1 = L3_1.find
  L10_1 = L7_1
  L11_1 = "\\syswow64\\config\\systemprofile\\appdata\\roaming\\microsoft\\office\\"
  L10_1 = L10_1 .. L11_1
  L11_1 = 1
  L12_1 = true
  L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
  if L8_1 ~= nil then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
elseif L2_1 == ".dll" then
  L9_1 = L3_1
  L8_1 = L3_1.find
  L10_1 = L5_1
  L11_1 = "\\assembly\\tmp\\"
  L10_1 = L10_1 .. L11_1
  L11_1 = 1
  L12_1 = true
  L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
  if L8_1 ~= nil then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
  L8_1 = L4_1
  L9_1 = "\\microsoft\\msoidentitycrl\\production"
  L8_1 = L8_1 .. L9_1
  if L3_1 == L8_1 then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
elseif L2_1 == ".js" then
  L9_1 = L3_1
  L8_1 = L3_1.find
  L10_1 = L5_1
  L11_1 = "\\microsoft\\windows\\inetcache\\ie\\"
  L10_1 = L10_1 .. L11_1
  L11_1 = 1
  L12_1 = true
  L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
  if L8_1 ~= nil then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
  L9_1 = L3_1
  L8_1 = L3_1.find
  L10_1 = L5_1
  L11_1 = "\\microsoft\\windows\\temporary internet files\\content.ie5\\"
  L10_1 = L10_1 .. L11_1
  L11_1 = 1
  L12_1 = true
  L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
  if L8_1 ~= nil then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
elseif L2_1 == ".com" then
  L8_1 = L5_1
  L9_1 = "\\microsoft\\forms"
  L8_1 = L8_1 .. L9_1
  if L3_1 == L8_1 then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
end
L8_1 = mp
L8_1 = L8_1.INFECTED
return L8_1
