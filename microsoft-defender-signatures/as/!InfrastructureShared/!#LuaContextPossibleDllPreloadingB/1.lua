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
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_FILENAME
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1)
if L1_1 ~= nil then
  L2_1 = #L1_1
  if not (L2_1 < 4) then
    goto lbl_33
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_33::
L2_1 = "winbio.dll|amsi.dll|wldp.dll|hid.dll|activeds.dll|credui.dll|dpx.dll|dui70.dll|duser.dll|dwmapi.dll|dxgi.dll|fvewiz.dll|mfc42u.dll|oleacc.dll|secur32.dll|slc.dll|spp.dll|tapi32.dll|uxtheme.dll|wer.dll|winbrand.dll|winmm.dll|winsta.dll|wtsapi32.dll|xmllite.dll"
L4_1 = L2_1
L3_1 = L2_1.find
L5_1 = L1_1
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = {}
L4_1 = {}
L4_1.AttributeName = "Lua:Bioload"
L5_1 = {}
L5_1.BM_FaceFodUninstaller_EXE = ""
L4_1.ContextNameList = L5_1
L5_1 = {}
L5_1["%windir%\\system32"] = ""
L5_1["%windir%\\syswow64"] = ""
L4_1.CleanPathList = L5_1
L3_1["winbio.dll"] = L4_1
L4_1 = {}
L4_1.AttributeName = "Lua:AmsiPreload"
L5_1 = {}
L5_1.BM_POWERSHELL_EXE = ""
L4_1.ContextNameList = L5_1
L5_1 = {}
L5_1["%windir%\\system32"] = ""
L5_1["%windir%\\syswow64"] = ""
L4_1.CleanPathList = L5_1
L3_1["amsi.dll"] = L4_1
L4_1 = {}
L4_1.AttributeName = "Lua:wldpBypass"
L5_1 = {}
L5_1.BM_RUNDLL32_EXE = ""
L4_1.ContextNameList = L5_1
L5_1 = {}
L5_1["%windir%\\system32"] = ""
L5_1["%windir%\\syswow64"] = ""
L4_1.CleanPathList = L5_1
L3_1["wldp.dll"] = L4_1
L4_1 = {}
L4_1.AttributeName = "Lua:hidPreload"
L5_1 = {}
L5_1.BM_OSK_EXE = ""
L4_1.ContextNameList = L5_1
L5_1 = {}
L5_1["%programfiles%\\common files\\microsoft shared\\ink"] = ""
L4_1.SuspPathList = L5_1
L5_1 = {}
L5_1["%windir%\\system32"] = ""
L5_1["%windir%\\syswow64"] = ""
L4_1.CleanPathList = L5_1
L3_1["hid.dll"] = L4_1
L4_1 = L3_1[L1_1]
if L4_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = "Lua:Preload"
L5_1 = L3_1[L1_1]
L5_1 = L5_1.AttributeName
if L5_1 ~= nil then
  L5_1 = L3_1[L1_1]
  L4_1 = L5_1.AttributeName
end
L5_1 = L3_1[L1_1]
L5_1 = L5_1.ContextNameList
if L5_1 == nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = L3_1[L1_1]
L5_1 = L5_1.CleanPathList
if L5_1 == nil then
  L5_1 = L3_1[L1_1]
  L5_1 = L5_1.SuspPathList
  if L5_1 == nil then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
end
L5_1 = mp
L5_1 = L5_1.getfilename
L6_1 = mp
L6_1 = L6_1.FILEPATH_QUERY_LOWERCASE
L5_1 = L5_1(L6_1)
if L5_1 ~= nil then
  L6_1 = #L5_1
  if not (L6_1 < 1) then
    goto lbl_132
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
do return L6_1 end
::lbl_132::
L6_1 = normalize_path
L7_1 = L5_1
L6_1 = L6_1(L7_1)
L5_1 = L6_1
L6_1 = string
L6_1 = L6_1.lower
L7_1 = mp
L7_1 = L7_1.get_contextdata
L8_1 = mp
L8_1 = L8_1.CONTEXT_DATA_PROCESSDEVICEPATH
L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1 = L7_1(L8_1)
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1)
if L6_1 ~= nil then
  L7_1 = #L6_1
  if not (L7_1 < 1) then
    goto lbl_152
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
do return L7_1 end
::lbl_152::
L7_1 = normalize_path
L8_1 = L6_1
L7_1 = L7_1(L8_1)
L6_1 = L7_1
if L5_1 ~= L6_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = ""
L8_1 = L3_1[L1_1]
L8_1 = L8_1.CleanPathList
if L8_1 ~= nil then
  L8_1 = pairs
  L9_1 = L3_1[L1_1]
  L9_1 = L9_1.CleanPathList
  L8_1, L9_1, L10_1 = L8_1(L9_1)
  for L11_1, L12_1 in L8_1, L9_1, L10_1 do
    L13_1 = normalize_path
    L14_1 = mp
    L14_1 = L14_1.ContextualExpandEnvironmentVariables
    L15_1 = L11_1
    L14_1, L15_1, L16_1, L17_1, L18_1, L19_1 = L14_1(L15_1)
    L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1, L18_1, L19_1)
    if L13_1 == L5_1 then
      L14_1 = mp
      L14_1 = L14_1.CLEAN
      return L14_1
    end
  end
  L7_1 = "NotInCleanPathList"
end
L8_1 = L3_1[L1_1]
L8_1 = L8_1.SuspPathList
if L8_1 ~= nil then
  L8_1 = pairs
  L9_1 = L3_1[L1_1]
  L9_1 = L9_1.SuspPathList
  L8_1, L9_1, L10_1 = L8_1(L9_1)
  for L11_1, L12_1 in L8_1, L9_1, L10_1 do
    L13_1 = normalize_path
    L14_1 = mp
    L14_1 = L14_1.ContextualExpandEnvironmentVariables
    L15_1 = L11_1
    L14_1, L15_1, L16_1, L17_1, L18_1, L19_1 = L14_1(L15_1)
    L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1, L18_1, L19_1)
    if L13_1 == L5_1 then
      L7_1 = "SuspPathList"
      break
    end
  end
end
L8_1 = string
L8_1 = L8_1.lower
L9_1 = mp
L9_1 = L9_1.get_contextdata
L10_1 = mp
L10_1 = L10_1.CONTEXT_DATA_PROCESSNAME
L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1 = L9_1(L10_1)
L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1)
if L8_1 ~= nil then
  L9_1 = #L8_1
  if L9_1 ~= 0 then
    goto lbl_222
  end
end
L9_1 = mp
L9_1 = L9_1.CLEAN
do return L9_1 end
::lbl_222::
L9_1 = L6_1
L10_1 = "\\"
L11_1 = L8_1
L9_1 = L9_1 .. L10_1 .. L11_1
L10_1 = pairs
L11_1 = L3_1[L1_1]
L11_1 = L11_1.ContextNameList
L10_1, L11_1, L12_1 = L10_1(L11_1)
for L13_1, L14_1 in L10_1, L11_1, L12_1 do
  L15_1 = MpCommon
  L15_1 = L15_1.QueryPersistContext
  L16_1 = L9_1
  L17_1 = L13_1
  L15_1 = L15_1(L16_1, L17_1)
  if L15_1 then
    L15_1 = L4_1
    L16_1 = "_"
    L17_1 = L13_1
    L18_1 = "!"
    L19_1 = L7_1
    L15_1 = L15_1 .. L16_1 .. L17_1 .. L18_1 .. L19_1
    L16_1 = #L15_1
    if 62 < L16_1 then
      L16_1 = mp
      L16_1 = L16_1.CLEAN
      return L16_1
    end
    L16_1 = mp
    L16_1 = L16_1.set_mpattribute
    L17_1 = L15_1
    L16_1(L17_1)
    L16_1 = mp
    L16_1 = L16_1.INFECTED
    return L16_1
  end
end
L10_1 = mp
L10_1 = L10_1.CLEAN
return L10_1
