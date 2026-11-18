-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/PossibleDllPreloading.B
-- Type: 10
-- Includes: Path
-- MpAttributes: MpOnOpenOrCloseRtpScan & RPF:TopLevelFile

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
if l_0_1 == nil or #l_0_1 < 4 then
  return mp.CLEAN
end
local l_0_2 = "winbio.dll|amsi.dll|wldp.dll|hid.dll|activeds.dll|credui.dll|dpx.dll|dui70.dll|duser.dll|dwmapi.dll|dxgi.dll|fvewiz.dll|mfc42u.dll|oleacc.dll|secur32.dll|slc.dll|spp.dll|tapi32.dll|uxtheme.dll|wer.dll|winbrand.dll|winmm.dll|winsta.dll|wtsapi32.dll|xmllite.dll"
if not l_0_2:find(l_0_1, 1, true) then
  return mp.CLEAN
end
local l_0_3 = {
  ["winbio.dll"] = {
    AttributeName = "Lua:Bioload",
    ContextNameList = {BM_FaceFodUninstaller_EXE = ""},
    CleanPathList = {
      ["%windir%\\system32"] = "",
      ["%windir%\\syswow64"] = ""
    }
  },
  ["amsi.dll"] = {
    AttributeName = "Lua:AmsiPreload",
    ContextNameList = {BM_POWERSHELL_EXE = ""},
    CleanPathList = {
      ["%windir%\\system32"] = "",
      ["%windir%\\syswow64"] = ""
    }
  },
  ["wldp.dll"] = {
    AttributeName = "Lua:wldpBypass",
    ContextNameList = {BM_RUNDLL32_EXE = ""},
    CleanPathList = {
      ["%windir%\\system32"] = "",
      ["%windir%\\syswow64"] = ""
    }
  },
  ["hid.dll"] = {
    AttributeName = "Lua:hidPreload",
    ContextNameList = {BM_OSK_EXE = ""},
    SuspPathList = {
      ["%programfiles%\\common files\\microsoft shared\\ink"] = ""
    },
    CleanPathList = {
      ["%windir%\\system32"] = "",
      ["%windir%\\syswow64"] = ""
    }
  }
}
if l_0_3[l_0_1] == nil then
  return mp.CLEAN
end
local l_0_4 = "Lua:Preload"
if l_0_3[l_0_1].AttributeName ~= nil then
  l_0_4 = l_0_3[l_0_1].AttributeName
end
if l_0_3[l_0_1].ContextNameList == nil then
  return mp.CLEAN
end
if l_0_3[l_0_1].CleanPathList == nil and l_0_3[l_0_1].SuspPathList == nil then
  return mp.CLEAN
end
local l_0_5 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_5 == nil or #l_0_5 < 1 then
  return mp.CLEAN
end
l_0_5 = normalize_path(l_0_5)
local l_0_6 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSDEVICEPATH))
if l_0_6 == nil or #l_0_6 < 1 then
  return mp.CLEAN
end
l_0_6 = normalize_path(l_0_6)
if l_0_5 ~= l_0_6 then
  return mp.CLEAN
end
local l_0_7 = ""
if l_0_3[l_0_1].CleanPathList ~= nil then
  for l_0_8, l_0_9 in pairs(l_0_3[l_0_1].CleanPathList) do
    local l_0_10 = normalize_path(mp.ContextualExpandEnvironmentVariables(l_0_8))
    if l_0_10 == l_0_5 then
      return mp.CLEAN
    end
  end
  l_0_7 = "NotInCleanPathList"
end
if l_0_3[l_0_1].SuspPathList ~= nil then
  for l_0_11, l_0_12 in pairs(l_0_3[l_0_1].SuspPathList) do
    if normalize_path(mp.ContextualExpandEnvironmentVariables(l_0_11)) == l_0_5 then
      l_0_7 = "SuspPathList"
      break
    end
  end
end
local l_0_13 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
if l_0_13 == nil or #l_0_13 == 0 then
  return mp.CLEAN
end
local l_0_14 = l_0_6 .. "\\" .. l_0_13
for l_0_15, l_0_16 in pairs(l_0_3[l_0_1].ContextNameList) do
  if MpCommon.QueryPersistContext(l_0_14, l_0_15) then
    local l_0_17 = l_0_4 .. "_" .. l_0_15 .. "!" .. l_0_7
    if 62 < #l_0_17 then
      return mp.CLEAN
    end
    mp.set_mpattribute(l_0_17)
    return mp.INFECTED
  end
end
return mp.CLEAN
