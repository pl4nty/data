local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = mp
L0_1 = L0_1.IsHipsRuleEnabled
L1_1 = "c1db55ab-c21a-4637-bb3f-a12568109d35"
L0_1 = L0_1(L1_1)
if L0_1 ~= true then
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
if L0_1 == L1_1 then
  L1_1 = mp
  L1_1 = L1_1.get_contextdata
  L2_1 = mp
  L2_1 = L2_1.CONTEXT_DATA_NEWLYCREATEDHINT
  L1_1 = L1_1(L2_1)
  if L1_1 ~= true then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
else
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONOPEN
  if L0_1 == L1_1 then
    L1_1 = mp
    L1_1 = L1_1.get_contextdata
    L2_1 = mp
    L2_1 = L2_1.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT
    L1_1 = L1_1(L2_1)
    if L1_1 ~= true then
      L1_1 = mp
      L1_1 = L1_1.bitand
      L2_1 = mp
      L2_1 = L2_1.get_contextdata
      L3_1 = mp
      L3_1 = L3_1.CONTEXT_DATA_DESIREDACCESS
      L2_1 = L2_1(L3_1)
      L3_1 = 32
      L1_1 = L1_1(L2_1, L3_1)
      if L1_1 ~= 32 then
        L1_1 = mp
        L1_1 = L1_1.CLEAN
        return L1_1
      end
    end
  else
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = peattributes
L1_1 = L1_1.isexe
if L1_1 ~= true then
  L1_1 = peattributes
  L1_1 = L1_1.isdll
  if L1_1 ~= true then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
if L1_1 < 256 or 50331648 < L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.get_mpattribute
L3_1 = "HSTR:AggressiveRansomScoping"
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.get_mpattribute
  L3_1 = "Lua:InitDataToCodeRatio"
  L2_1 = L2_1(L3_1)
  if not L2_1 then
    L2_1 = mp
    L2_1 = L2_1.get_mpattribute
    L3_1 = "Lua:RsrcDataToCodeRatio"
    L2_1 = L2_1(L3_1)
    if not L2_1 then
      L2_1 = peattributes
      L2_1 = L2_1.dynmem_APIcall
      L2_1 = not L2_1
      if L2_1 == true then
        L2_1 = peattributes
        L2_1 = L2_1.dynmem_checks_if_debugged_doc
        L2_1 = not L2_1
        if L2_1 == true then
          L2_1 = peattributes
          L2_1 = L2_1.dynmem_checks_if_debugged_undoc
          L2_1 = not L2_1
          if L2_1 == true then
            L2_1 = peattributes
            L2_1 = L2_1.dynmem_detects_virtualpc
            L2_1 = not L2_1
            if L2_1 == true then
              L2_1 = peattributes
              L2_1 = L2_1.dynmem_detects_vm
              L2_1 = not L2_1
              if L2_1 == true then
                L2_1 = peattributes
                L2_1 = L2_1.dynmem_detects_vmware
                L2_1 = not L2_1
                if L2_1 == true then
                  L2_1 = peattributes
                  L2_1 = L2_1.dynmem_kernel_scan
                  L2_1 = not L2_1
                  if L2_1 == true then
                    L2_1 = peattributes
                    L2_1 = L2_1.dynmem_reads_vdll_code
                    L2_1 = not L2_1
                    if L2_1 == true then
                      L2_1 = peattributes
                      L2_1 = L2_1.dynmem_self_modifying_code
                      L2_1 = not L2_1
                      if L2_1 == true then
                        L2_1 = peattributes
                        L2_1 = L2_1.executes_from_dynamic_memory
                        L2_1 = not L2_1
                        if L2_1 == true then
                          L2_1 = mp
                          L2_1 = L2_1.CLEAN
                          return L2_1
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.getfilename
L3_1 = mp
L3_1 = L3_1.bitor
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_FULL
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_LOWERCASE
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L3_1(L4_1, L5_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
if L2_1 ~= nil and L2_1 ~= "" then
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = MpCommon
  L4_1 = L4_1.PathToWin32Path
  L5_1 = L2_1
  L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L4_1(L5_1)
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
  L2_1 = L3_1
  L3_1 = mp
  L3_1 = L3_1.IsPathExcludedForHipsRule
  L4_1 = L2_1
  L5_1 = "c1db55ab-c21a-4637-bb3f-a12568109d35"
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = ".:\\windows\\installer\\[^\\]+%.tmp$"
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = ".:\\windows\\assembly\\nativeimages_[^\\]+\\[^\\]+\\[0-9a-f]+\\[^\\]+%.ni%.dll$"
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = ".:\\program files[^\\]*\\notepad%+%+\\"
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = ".:\\program files[^\\]*\\eporezna\\eporeznachromesupportfiles\\"
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = ".:\\program files[^\\]*\\common files\\microsoft shared\\clicktorun\\"
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end
L3_1 = mp
L3_1 = L3_1.IsTrustedFile
L4_1 = false
L3_1, L4_1 = L3_1(L4_1)
if L3_1 == true then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = false
while true do
  L6_1 = {}
  L6_1["RPF:ApiCallsClassifier.Probability"] = true
  L6_1["RPF:Gamorthic_Classifier"] = true
  L6_1["RPF:MsilRoutineLenClassifier"] = true
  L6_1["RPF:PEATTR_SIGATTR:PREDICT:30"] = true
  L6_1["RPF:PEATTR_SIGATTR:PREDICT:40"] = true
  L6_1["RPF:PEATTR_SIGATTR:PREDICT:50"] = true
  L6_1["RPF:PEATTR_SIGATTR:PREDICT:70"] = true
  L6_1["RPF:PEATTR_SIGATTR:PREDICT:90"] = true
  L6_1["RPF:VBKcrcLenClassifier"] = true
  L7_1 = pairs
  L8_1 = L6_1
  L7_1, L8_1, L9_1 = L7_1(L8_1)
  for L10_1, L11_1 in L7_1, L8_1, L9_1 do
    if L11_1 == true then
      L12_1 = mp
      L12_1 = L12_1.get_mpattribute
      L13_1 = L10_1
      L12_1 = L12_1(L13_1)
      if L12_1 == true then
        L5_1 = true
        break
      end
    end
  end
  if L5_1 then
    break
  end
  L7_1 = {}
  L7_1["Lua:Context7ZipExtracted.A"] = true
  L7_1["Lua:Context7ZipExtracted.B"] = true
  L7_1["Lua:ContextCmdAccessTIF.A"] = true
  L7_1["Lua:ContextCmdDropTIF.A"] = true
  L7_1["Lua:ContextControlAccessTemp.A"] = true
  L7_1["Lua:ContextControlAccessTIF.A"] = true
  L7_1["Lua:ContextEKAcroRdDrop"] = true
  L7_1["Lua:ContextEKAcroRdDropTest"] = true
  L7_1["Lua:ContextEKExplorerDrop"] = true
  L7_1["Lua:ContextEKExplorerDropTest"] = true
  L7_1["Lua:ContextEKFirefoxDrop"] = true
  L7_1["Lua:ContextEKFirefoxDropTest"] = true
  L7_1["Lua:ContextEKIEDrop"] = true
  L7_1["Lua:ContextEKIEDropTest"] = true
  L7_1["Lua:ContextEKJavaDrop"] = true
  L7_1["Lua:ContextEKJavaDropTest"] = true
  L7_1["Lua:ContextEKOperaDrop"] = true
  L7_1["Lua:ContextEKOperaDropTest"] = true
  L7_1["Lua:ContextEKOtherDrop"] = true
  L7_1["Lua:ContextEKOtherDropTest"] = true
  L7_1["Lua:ContextExplorerZIPExtracted.A"] = true
  L7_1["Lua:ContextFileNameBtvstack.A"] = true
  L7_1["Lua:ContextIRSetupExtracted.A"] = true
  L7_1["Lua:ContextRegsvr32AccessTemp.A"] = true
  L7_1["Lua:ContextRegsvr32AccessTIF.A"] = true
  L7_1["Lua:ContextScriptTempDll.A"] = true
  L7_1["Lua:ContextScriptTempExe.A"] = true
  L7_1["Lua:ContextualDropIELocalLow"] = true
  L7_1["Lua:ContextualDropMsiexecKB.A"] = true
  L7_1["Lua:ContextualDropOperaTemp"] = true
  L7_1["Lua:ContextualDropPlugincontainerTemp"] = true
  L7_1["Lua:ContextualDropSvchostTemp"] = true
  L7_1["Lua:ContextualDropSvchostTemp.B"] = true
  L7_1["Lua:ContextualDropTmpExe.A"] = true
  L7_1["Lua:ContextualDropVmhostTemp"] = true
  L7_1["Lua:ContextWinRARExtracted.A"] = true
  L7_1["Lua:ContextWinZipExtracted.A"] = true
  L8_1 = pairs
  L9_1 = L7_1
  L8_1, L9_1, L10_1 = L8_1(L9_1)
  for L11_1, L12_1 in L8_1, L9_1, L10_1 do
    if L12_1 == true then
      L13_1 = mp
      L13_1 = L13_1.get_mpattribute
      L14_1 = L11_1
      L13_1 = L13_1(L14_1)
      if L13_1 == true then
        L5_1 = true
        break
      end
    end
  end
  if L5_1 then
    break
  end
  L8_1 = {}
  L8_1["cmd.exe"] = true
  L8_1["cscript.exe"] = true
  L8_1["java.exe"] = true
  L8_1["javaw.exe"] = true
  L8_1["mshta.exe"] = true
  L8_1["powershell.exe"] = true
  L8_1["rundll32.exe"] = true
  L8_1["wscript.exe"] = true
  L9_1 = mp
  L9_1 = L9_1.get_contextdata
  L10_1 = mp
  L10_1 = L10_1.CONTEXT_DATA_PROCESSNAME
  L9_1 = L9_1(L10_1)
  if L9_1 == nil then
    L10_1 = ""
    if L10_1 then
      goto lbl_349
    end
  end
  L10_1 = L9_1
  ::lbl_349::
  L11_1 = L10_1
  L10_1 = L10_1.lower
  L10_1 = L10_1(L11_1)
  L9_1 = L10_1
  L10_1 = L8_1[L9_1]
  if L10_1 == true then
    L5_1 = true
  end
  break
end
if L5_1 == true then
  L6_1 = mp
  L6_1 = L6_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L0_1 == L6_1 then
    L6_1 = mp
    L6_1 = L6_1.set_mpattribute
    L7_1 = "MpDisableCaching"
    L6_1(L7_1)
    L6_1 = mp
    L6_1 = L6_1.INFECTED
    return L6_1
  else
    L6_1 = mp
    L6_1 = L6_1.get_mpattribute
    L7_1 = "CLOUD:ASRResponderBlockExecution"
    L6_1 = L6_1(L7_1)
    if L6_1 then
      L6_1 = mp
      L6_1 = L6_1.SetHipsRule
      L7_1 = "c1db55ab-c21a-4637-bb3f-a12568109d35"
      L6_1(L7_1)
      L6_1 = mp
      L6_1 = L6_1.BLOCKEXECUTION
      return L6_1
    end
    L6_1 = mp
    L6_1 = L6_1.set_mpattribute
    L7_1 = "MpDisableCaching"
    L6_1(L7_1)
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
