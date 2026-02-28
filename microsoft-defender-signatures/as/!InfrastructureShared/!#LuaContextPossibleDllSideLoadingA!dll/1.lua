local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
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
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
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
L2_1 = {}
L2_1["version.dll"] = ":\\windows\\system32"
L2_1["activeds.dll"] = ":\\windows\\system32"
L2_1["credui.dll"] = ":\\windows\\system32"
L2_1["dpx.dll"] = ":\\windows\\system32"
L2_1["dui70.dll"] = ":\\windows\\system32"
L2_1["duser.dll"] = ":\\windows\\system32"
L2_1["dwmapi.dll"] = ":\\windows\\system32"
L2_1["dxgi.dll"] = ":\\windows\\system32"
L2_1["fvewiz.dll"] = ":\\windows\\system32"
L2_1["mfc42u.dll"] = ":\\windows\\system32"
L2_1["oleacc.dll"] = ":\\windows\\system32"
L2_1["secur32.dll"] = ":\\windows\\system32"
L2_1["slc.dll"] = ":\\windows\\system32"
L2_1["spp.dll"] = ":\\windows\\system32"
L2_1["tapi32.dll"] = ":\\windows\\system32"
L2_1["uxtheme.dll"] = ":\\windows\\system32"
L2_1["wer.dll"] = ":\\windows\\system32"
L2_1["winbrand.dll"] = ":\\windows\\system32"
L2_1["winmm.dll"] = ":\\windows\\system32"
L2_1["winsta.dll"] = ":\\windows\\system32"
L2_1["wtsapi32.dll"] = ":\\windows\\system32"
L2_1["xmllite.dll"] = ":\\windows\\system32"
L3_1 = L2_1[L1_1]
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.getfilename
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_LOWERCASE
L4_1 = L4_1(L5_1)
if L4_1 ~= nil then
  L5_1 = #L4_1
  if not (L5_1 < 1) then
    goto lbl_75
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_75::
L6_1 = L4_1
L5_1 = L4_1.sub
L7_1 = 1
L8_1 = 8
L5_1 = L5_1(L6_1, L7_1, L8_1)
if L5_1 == "\\device\\" then
  L5_1 = MpCommon
  L5_1 = L5_1.PathToWin32Path
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  L4_1 = L5_1
  if L4_1 == nil then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = string
  L5_1 = L5_1.lower
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  L4_1 = L5_1
end
L6_1 = L4_1
L5_1 = L4_1.sub
L7_1 = 1
L8_1 = 4
L5_1 = L5_1(L6_1, L7_1, L8_1)
if L5_1 == "\\\\?\\" then
  L6_1 = L4_1
  L5_1 = L4_1.sub
  L7_1 = 5
  L5_1 = L5_1(L6_1, L7_1)
  L4_1 = L5_1
end
L5_1 = string
L5_1 = L5_1.sub
L6_1 = L4_1
L7_1 = 2
L5_1 = L5_1(L6_1, L7_1)
if L5_1 == L3_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.get_contextdata
L6_1 = mp
L6_1 = L6_1.CONTEXT_DATA_PROCESSNAME
L5_1 = L5_1(L6_1)
L6_1 = L5_1
L5_1 = L5_1.lower
L5_1 = L5_1(L6_1)
if L5_1 ~= nil then
  L6_1 = #L5_1
  if L6_1 ~= 0 then
    goto lbl_131
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
do return L6_1 end
::lbl_131::
L6_1 = L4_1
L7_1 = "\\"
L8_1 = L5_1
L6_1 = L6_1 .. L7_1 .. L8_1
L7_1 = MpCommon
L7_1 = L7_1.QueryPersistContext
L8_1 = L6_1
L9_1 = "CheckPossibleDllSideLoadingA"
L7_1 = L7_1(L8_1, L9_1)
if L7_1 then
  L7_1 = "Lua:Context/PossibleDllSideLoading.A!"
  L8_1 = L1_1
  L7_1 = L7_1 .. L8_1
  L8_1 = mp
  L8_1 = L8_1.set_mpattribute
  L9_1 = L7_1
  L8_1(L9_1)
  L8_1 = mp
  L8_1 = L8_1.INFECTED
  return L8_1
else
  L7_1 = mp
  L7_1 = L7_1.get_contextdata
  L8_1 = mp
  L8_1 = L8_1.CONTEXT_DATA_NEWLYCREATEDHINT
  L7_1 = L7_1(L8_1)
  if L7_1 == true then
    L7_1 = L4_1
    L8_1 = "\\"
    L9_1 = L1_1
    L7_1 = L7_1 .. L8_1 .. L9_1
    L8_1 = mp
    L8_1 = L8_1.IsKnownFriendlyFile
    L9_1 = L7_1
    L10_1 = false
    L11_1 = false
    L8_1 = L8_1(L9_1, L10_1, L11_1)
    if L8_1 ~= true then
      L8_1 = mp
      L8_1 = L8_1.IsTrustedFile
      L9_1 = false
      L8_1 = L8_1(L9_1)
      if L8_1 ~= true then
        goto lbl_181
      end
    end
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    do return L8_1 end
    ::lbl_181::
    L8_1 = mp
    L8_1 = L8_1.set_mpattribute
    L9_1 = "MpDisableCaching"
    L8_1(L9_1)
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
