-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFLUAASRc1db55ab-\0x00001c12_luac 

-- params : ...
-- function num : 0
if (mp.IsHipsRuleEnabled)("c1db55ab-c21a-4637-bb3f-a12568109d35") ~= true then
  return mp.CLEAN
end
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
-- DECOMPILER ERROR at PC27: Unhandled construct in 'MakeBoolean' P1

if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and (mp.get_contextdata)(mp.CONTEXT_DATA_NEWLYCREATEDHINT) ~= true then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC53: Unhandled construct in 'MakeBoolean' P1

if l_0_0 == mp.SCANREASON_ONOPEN and (mp.get_contextdata)(mp.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT) ~= true and (mp.bitand)((mp.get_contextdata)(mp.CONTEXT_DATA_DESIREDACCESS), 32) ~= 32 then
  return mp.CLEAN
end
do return mp.CLEAN end
if peattributes.isexe ~= true and peattributes.isdll ~= true then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilesize)()
if l_0_1 < 256 or l_0_1 > 50331648 then
  return mp.CLEAN
end
if not (mp.get_mpattribute)("HSTR:AggressiveRansomScoping") and not (mp.get_mpattribute)("Lua:InitDataToCodeRatio") and not (mp.get_mpattribute)("Lua:RsrcDataToCodeRatio") and not peattributes.dynmem_APIcall == true and not peattributes.dynmem_checks_if_debugged_doc == true and not peattributes.dynmem_checks_if_debugged_undoc == true and not peattributes.dynmem_detects_virtualpc == true and not peattributes.dynmem_detects_vm == true and not peattributes.dynmem_detects_vmware == true and not peattributes.dynmem_kernel_scan == true and not peattributes.dynmem_reads_vdll_code == true and not peattributes.dynmem_self_modifying_code == true and not peattributes.executes_from_dynamic_memory == true then
  return mp.CLEAN
end
local l_0_2 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_2 ~= nil and l_0_2 ~= "" then
  l_0_2 = (string.lower)((MpCommon.PathToWin32Path)(l_0_2))
  if (mp.IsPathExcludedForHipsRule)(l_0_2, "c1db55ab-c21a-4637-bb3f-a12568109d35") then
    return mp.CLEAN
  end
  if (string.find)(l_0_2, ".:\\windows\\installer\\[^\\]+%.tmp$") then
    return mp.CLEAN
  end
  if (string.find)(l_0_2, ".:\\windows\\assembly\\nativeimages_[^\\]+\\[^\\]+\\[0-9a-f]+\\[^\\]+%.ni%.dll$") then
    return mp.CLEAN
  end
  if (string.find)(l_0_2, ".:\\program files[^\\]*\\notepad%+%+\\") then
    return mp.CLEAN
  end
  if (string.find)(l_0_2, ".:\\program files[^\\]*\\eporezna\\eporeznachromesupportfiles\\") then
    return mp.CLEAN
  end
end
local l_0_3, l_0_4 = (mp.IsTrustedFile)(false)
if l_0_3 == true then
  return mp.CLEAN
end
local l_0_5 = false
while 1 do
  local l_0_6 = {}
  l_0_6["RPF:ApiCallsClassifier.Probability"] = true
  l_0_6["RPF:Gamorthic_Classifier"] = true
  l_0_6["RPF:MsilRoutineLenClassifier"] = true
  l_0_6["RPF:PEATTR_SIGATTR:PREDICT:30"] = true
  l_0_6["RPF:PEATTR_SIGATTR:PREDICT:40"] = true
  l_0_6["RPF:PEATTR_SIGATTR:PREDICT:50"] = true
  l_0_6["RPF:PEATTR_SIGATTR:PREDICT:70"] = true
  l_0_6["RPF:PEATTR_SIGATTR:PREDICT:90"] = true
  l_0_6["RPF:VBKcrcLenClassifier"] = true
  for l_0_10,l_0_11 in pairs(l_0_6) do
    if l_0_11 == true and (mp.get_mpattribute)(l_0_10) == true then
      l_0_5 = true
      break
    end
  end
  do
    if l_0_5 then
      break
    end
    local l_0_12 = {}
    l_0_12["Lua:Context7ZipExtracted.A"] = true
    l_0_12["Lua:Context7ZipExtracted.B"] = true
    l_0_12["Lua:ContextCmdAccessTIF.A"] = true
    l_0_12["Lua:ContextCmdDropTIF.A"] = true
    l_0_12["Lua:ContextControlAccessTemp.A"] = true
    l_0_12["Lua:ContextControlAccessTIF.A"] = true
    l_0_12["Lua:ContextEKAcroRdDrop"] = true
    l_0_12["Lua:ContextEKAcroRdDropTest"] = true
    l_0_12["Lua:ContextEKExplorerDrop"] = true
    l_0_12["Lua:ContextEKExplorerDropTest"] = true
    l_0_12["Lua:ContextEKFirefoxDrop"] = true
    l_0_12["Lua:ContextEKFirefoxDropTest"] = true
    l_0_12["Lua:ContextEKIEDrop"] = true
    l_0_12["Lua:ContextEKIEDropTest"] = true
    l_0_12["Lua:ContextEKJavaDrop"] = true
    l_0_12["Lua:ContextEKJavaDropTest"] = true
    l_0_12["Lua:ContextEKOperaDrop"] = true
    l_0_12["Lua:ContextEKOperaDropTest"] = true
    l_0_12["Lua:ContextEKOtherDrop"] = true
    l_0_12["Lua:ContextEKOtherDropTest"] = true
    l_0_12["Lua:ContextExplorerZIPExtracted.A"] = true
    l_0_12["Lua:ContextFileNameBtvstack.A"] = true
    l_0_12["Lua:ContextIRSetupExtracted.A"] = true
    l_0_12["Lua:ContextRegsvr32AccessTemp.A"] = true
    l_0_12["Lua:ContextRegsvr32AccessTIF.A"] = true
    l_0_12["Lua:ContextScriptTempDll.A"] = true
    l_0_12["Lua:ContextScriptTempExe.A"] = true
    l_0_12["Lua:ContextualDropIELocalLow"] = true
    l_0_12["Lua:ContextualDropMsiexecKB.A"] = true
    l_0_12["Lua:ContextualDropOperaTemp"] = true
    l_0_12["Lua:ContextualDropPlugincontainerTemp"] = true
    l_0_12["Lua:ContextualDropSvchostTemp"] = true
    l_0_12["Lua:ContextualDropSvchostTemp.B"] = true
    l_0_12["Lua:ContextualDropTmpExe.A"] = true
    l_0_12["Lua:ContextualDropVmhostTemp"] = true
    l_0_12["Lua:ContextWinRARExtracted.A"] = true
    l_0_12["Lua:ContextWinZipExtracted.A"] = true
    for l_0_16,l_0_17 in pairs(l_0_12) do
      if l_0_17 == true and (mp.get_mpattribute)(l_0_16) == true then
        l_0_5 = true
        break
      end
    end
    do
      if l_0_5 then
        break
      end
      local l_0_18 = {}
      l_0_18["cmd.exe"] = true
      l_0_18["cscript.exe"] = true
      l_0_18["java.exe"] = true
      l_0_18["javaw.exe"] = true
      l_0_18["mshta.exe"] = true
      l_0_18["powershell.exe"] = true
      l_0_18["rundll32.exe"] = true
      l_0_18["wscript.exe"] = true
      do
        local l_0_19 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
        l_0_19 = (l_0_19 == nil and "" or l_0_19):lower()
        if l_0_18[l_0_19] == true then
          l_0_5 = true
        end
        do break end
        -- DECOMPILER ERROR at PC346: LeaveBlock: unexpected jumping out DO_STMT

        -- DECOMPILER ERROR at PC346: LeaveBlock: unexpected jumping out DO_STMT

      end
    end
  end
end
if l_0_5 == true then
  l_0_6 = mp
  l_0_6 = l_0_6.SCANREASON_ONMODIFIEDHANDLECLOSE
  if l_0_0 == l_0_6 then
    l_0_6 = mp
    l_0_6 = l_0_6.set_mpattribute
    l_0_6("MpDisableCaching")
    l_0_6 = mp
    l_0_6 = l_0_6.INFECTED
    return l_0_6
  else
    l_0_6 = mp
    l_0_6 = l_0_6.get_mpattribute
    l_0_6 = l_0_6("CLOUD:ASRResponderBlockExecution")
    if l_0_6 then
      l_0_6 = mp
      l_0_6 = l_0_6.SetHipsRule
      l_0_6("c1db55ab-c21a-4637-bb3f-a12568109d35")
      l_0_6 = mp
      l_0_6 = l_0_6.BLOCKEXECUTION
      return l_0_6
    end
    l_0_6 = mp
    l_0_6 = l_0_6.set_mpattribute
    l_0_6("MpDisableCaching")
  end
end
l_0_6 = mp
l_0_6 = l_0_6.CLEAN
return l_0_6

