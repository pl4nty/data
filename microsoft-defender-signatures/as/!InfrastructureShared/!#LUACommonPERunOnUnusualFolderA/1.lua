-- Threat: !InfrastructureShared
-- Name: !#LUA:CommonPERunOnUnusualFolder.A
-- Type: 9
-- MpAttributes: RPF:TopLevelFile & pea_isexe & !pea_isdamaged & !PEPCODE:HasDigitalSignature

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
  if #l_0_1 < 8 or 22 < #l_0_1 then
    return mp.CLEAN
  end
  if l_0_0:find("winsxs", 1, true) or l_0_0:find("\\os\\", 1, true) or l_0_0:find("\\device\\", 1, true) or l_0_0:find("\\src\\", 1, true) or l_0_0:find("amd64", 1, true) or l_0_0:find("x86fre", 1, true) or l_0_0:find("ia64fre", 1, true) or l_0_0:find("\\extractedfiles\\", 1, true) or l_0_0:find("\\windowsapps\\", 1, true) or l_0_0:find("\\x86", 1, true) or l_0_0:find("\\program files\\", 1, true) or l_0_0:find("\\debug\\", 1, true) or l_0_0:find("\\release\\", 1, true) or l_0_0:find("\\obj\\", 1, true) or l_0_0:find("\\bin\\", 1, true) or l_0_0:find("\\stubexe\\", 1, true) or l_0_0:find("backup", 1, true) or l_0_0:find("atosc2", 1, true) or l_0_0:find("system32", 1, true) or l_0_0:find("syswow64", 1, true) or l_0_0:find("nservices", 1, true) then
    return mp.CLEAN
  end
  local l_0_2 = {
    ["wininit.exe"] = true,
    ["smss.exe"] = true,
    ["explorer.exe"] = true,
    ["lsass.exe"] = true,
    ["svchost.exe"] = true,
    ["conhost.exe"] = true,
    ["consent.exe"] = true,
    ["csrss.exe"] = true,
    ["dllhost.exe"] = true,
    ["fontdrvhost.exe"] = true,
    ["ie4uinit.exe"] = true,
    ["lsaiso.exe"] = true,
    ["msdtc.exe"] = true,
    ["mshta.exe"] = true,
    ["ntoskrnl.exe"] = true,
    ["runonce.exe"] = true,
    ["runtimebroker.exe"] = true,
    ["sdiagnhost.exe"] = true,
    ["searchfilterhost.exe"] = true,
    ["searchindexer.exe"] = true,
    ["searchprotocolhost.exe"] = true,
    ["services.exe"] = true,
    ["spoolsv.exe"] = true,
    ["synchost.exe"] = true,
    ["taskmgr.exe"] = true,
    ["werfault.exe"] = true,
    ["werfaultsecure.exe"] = true,
    ["winlogon.exe"] = true,
    ["audiodg.exe"] = true,
    ["taskhostw.exe"] = true,
    ["appvclient.exe"] = true,
    ["splwow64.exe"] = true,
    ["wmiprvse.exe"] = true,
    ["wuauclt.exe"] = true,
    ["vssvc.exe"] = true,
    ["wsmprovhost.exe"] = true,
    ["wmiapsrv.exe"] = true,
    ["sppsvc.exe"] = true,
    ["fxssvc.exe"] = true
  }
  if l_0_2[l_0_1] then
    return mp.INFECTED
  end
end
return mp.CLEAN
