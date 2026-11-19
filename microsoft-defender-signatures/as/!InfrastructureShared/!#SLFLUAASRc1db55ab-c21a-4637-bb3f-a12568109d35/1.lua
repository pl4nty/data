-- Threat: !InfrastructureShared
-- Name: !#SLF:LUA:ASR:c1db55ab-c21a-4637-bb3f-a12568109d35
-- Type: 11

if mp.IsHipsRuleEnabled("c1db55ab-c21a-4637-bb3f-a12568109d35") ~= true then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  if mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) ~= true then
    return mp.CLEAN
  end
elseif l_0_0 == mp.SCANREASON_ONOPEN then
  if mp.get_contextdata(mp.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT) ~= true and mp.bitand(mp.get_contextdata(mp.CONTEXT_DATA_DESIREDACCESS), 32) ~= 32 then
    return mp.CLEAN
  end
else
  return mp.CLEAN
end
if peattributes.isexe ~= true and peattributes.isdll ~= true then
  return mp.CLEAN
end
local l_0_1 = mp.getfilesize()
if l_0_1 < 256 or 50331648 < l_0_1 then
  return mp.CLEAN
end
if not mp.get_mpattribute("HSTR:AggressiveRansomScoping") and not mp.get_mpattribute("Lua:InitDataToCodeRatio") and not mp.get_mpattribute("Lua:RsrcDataToCodeRatio") and not peattributes.dynmem_APIcall == true and not peattributes.dynmem_checks_if_debugged_doc == true and not peattributes.dynmem_checks_if_debugged_undoc == true and not peattributes.dynmem_detects_virtualpc == true and not peattributes.dynmem_detects_vm == true and not peattributes.dynmem_detects_vmware == true and not peattributes.dynmem_kernel_scan == true and not peattributes.dynmem_reads_vdll_code == true and not peattributes.dynmem_self_modifying_code == true and not peattributes.executes_from_dynamic_memory == true then
  return mp.CLEAN
end
local l_0_2 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_2 ~= nil and l_0_2 ~= "" then
  l_0_2 = string.lower(MpCommon.PathToWin32Path(l_0_2))
  if mp.IsPathExcludedForHipsRule(l_0_2, "c1db55ab-c21a-4637-bb3f-a12568109d35") then
    return mp.CLEAN
  end
  if string.find(l_0_2, ".:\\windows\\installer\\[^\\]+%.tmp$") then
    return mp.CLEAN
  end
  if string.find(l_0_2, ".:\\windows\\assembly\\nativeimages_[^\\]+\\[^\\]+\\[0-9a-f]+\\[^\\]+%.ni%.dll$") then
    return mp.CLEAN
  end
  if string.find(l_0_2, ".:\\program files[^\\]*\\notepad%+%+\\") then
    return mp.CLEAN
  end
  if string.find(l_0_2, ".:\\program files[^\\]*\\eporezna\\eporeznachromesupportfiles\\") then
    return mp.CLEAN
  end
  if string.find(l_0_2, ".:\\program files[^\\]*\\common files\\microsoft shared\\clicktorun\\") then
    return mp.CLEAN
  end
end
local l_0_3, l_0_4 = mp.IsTrustedFile(false)
if l_0_3 == true then
  return mp.CLEAN
end
local l_0_5 = false
while true do
  local l_0_6 = {
    ["RPF:ApiCallsClassifier.Probability"] = true,
    ["RPF:Gamorthic_Classifier"] = true,
    ["RPF:MsilRoutineLenClassifier"] = true,
    ["RPF:PEATTR_SIGATTR:PREDICT:30"] = true,
    ["RPF:PEATTR_SIGATTR:PREDICT:40"] = true,
    ["RPF:PEATTR_SIGATTR:PREDICT:50"] = true,
    ["RPF:PEATTR_SIGATTR:PREDICT:70"] = true,
    ["RPF:PEATTR_SIGATTR:PREDICT:90"] = true,
    ["RPF:VBKcrcLenClassifier"] = true
  }
  for l_0_7, l_0_8 in pairs(l_0_6) do
    if l_0_8 == true and mp.get_mpattribute(l_0_7) == true then
      l_0_5 = true
      break
    end
  end
  if l_0_5 then
    break
  end
  local l_0_9 = {
    ["Lua:Context7ZipExtracted.A"] = true,
    ["Lua:Context7ZipExtracted.B"] = true,
    ["Lua:ContextCmdAccessTIF.A"] = true,
    ["Lua:ContextCmdDropTIF.A"] = true,
    ["Lua:ContextControlAccessTemp.A"] = true,
    ["Lua:ContextControlAccessTIF.A"] = true,
    ["Lua:ContextEKAcroRdDrop"] = true,
    ["Lua:ContextEKAcroRdDropTest"] = true,
    ["Lua:ContextEKExplorerDrop"] = true,
    ["Lua:ContextEKExplorerDropTest"] = true,
    ["Lua:ContextEKFirefoxDrop"] = true,
    ["Lua:ContextEKFirefoxDropTest"] = true,
    ["Lua:ContextEKIEDrop"] = true,
    ["Lua:ContextEKIEDropTest"] = true,
    ["Lua:ContextEKJavaDrop"] = true,
    ["Lua:ContextEKJavaDropTest"] = true,
    ["Lua:ContextEKOperaDrop"] = true,
    ["Lua:ContextEKOperaDropTest"] = true,
    ["Lua:ContextEKOtherDrop"] = true,
    ["Lua:ContextEKOtherDropTest"] = true,
    ["Lua:ContextExplorerZIPExtracted.A"] = true,
    ["Lua:ContextFileNameBtvstack.A"] = true,
    ["Lua:ContextIRSetupExtracted.A"] = true,
    ["Lua:ContextRegsvr32AccessTemp.A"] = true,
    ["Lua:ContextRegsvr32AccessTIF.A"] = true,
    ["Lua:ContextScriptTempDll.A"] = true,
    ["Lua:ContextScriptTempExe.A"] = true,
    ["Lua:ContextualDropIELocalLow"] = true,
    ["Lua:ContextualDropMsiexecKB.A"] = true,
    ["Lua:ContextualDropOperaTemp"] = true,
    ["Lua:ContextualDropPlugincontainerTemp"] = true,
    ["Lua:ContextualDropSvchostTemp"] = true,
    ["Lua:ContextualDropSvchostTemp.B"] = true,
    ["Lua:ContextualDropTmpExe.A"] = true,
    ["Lua:ContextualDropVmhostTemp"] = true,
    ["Lua:ContextWinRARExtracted.A"] = true,
    ["Lua:ContextWinZipExtracted.A"] = true
  }
  for l_0_10, l_0_11 in pairs(l_0_9) do
    if l_0_11 == true and mp.get_mpattribute(l_0_10) == true then
      l_0_5 = true
      break
    end
  end
  if l_0_5 then
    break
  end
  local l_0_12 = {
    ["cmd.exe"] = true,
    ["cscript.exe"] = true,
    ["java.exe"] = true,
    ["javaw.exe"] = true,
    ["mshta.exe"] = true,
    ["powershell.exe"] = true,
    ["rundll32.exe"] = true,
    ["wscript.exe"] = true
  }
  local l_0_13 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
  l_0_13 = (l_0_13 == nil and "" or l_0_13):lower()
  if l_0_12[l_0_13] == true then
    l_0_5 = true
  end
  break
end
if l_0_5 == true then
  if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
    mp.set_mpattribute("MpDisableCaching")
    return mp.INFECTED
  else
    if mp.get_mpattribute("CLOUD:ASRResponderBlockExecution") then
      mp.SetHipsRule("c1db55ab-c21a-4637-bb3f-a12568109d35")
      return mp.BLOCKEXECUTION
    end
    mp.set_mpattribute("MpDisableCaching")
  end
end
return mp.CLEAN
