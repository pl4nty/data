local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FNAME
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_PATH
L2_1 = L2_1(L3_1, L4_1)
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L1_1(L2_1, L3_1)
L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
if L0_1 == nil or L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_PROCESSNAME
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
L3_1 = mp
L3_1 = L3_1.set_mpattribute
L4_1 = "Lua:ImpacketAccessBy!"
L5_1 = L2_1
L4_1 = L4_1 .. L5_1
L3_1(L4_1)
L4_1 = L0_1
L3_1 = L0_1.find
L5_1 = "\\site-packages\\"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if not L3_1 then
  L4_1 = L0_1
  L3_1 = L0_1.find
  L5_1 = "\\dist-packages\\"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if not L3_1 then
    goto lbl_64
  end
end
L3_1 = mp
L3_1 = L3_1.set_mpattribute
L4_1 = "Lua:ImpacketInSitePackages"
L3_1(L4_1)
::lbl_64::
L4_1 = L0_1
L3_1 = L0_1.find
L5_1 = "\\users\\.+\\downloads"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:ImpacketInDownloads"
  L3_1(L4_1)
end
L3_1 = {}
L3_1["addcomputer.py"] = true
L3_1["atexec.py"] = true
L3_1["changepasswd.py"] = true
L3_1["dcomexec.py"] = true
L3_1["dpapi.py"] = true
L3_1["dumpntlminfo.py"] = true
L3_1["esentutl.py"] = true
L3_1["exchanger.py"] = true
L3_1["finddelegation.py"] = true
L3_1["get-gpppassword.py"] = true
L3_1["getadusers.py"] = true
L3_1["getarch.py"] = true
L3_1["getnpusers.py"] = true
L3_1["getpac.py"] = true
L3_1["getst.py"] = true
L3_1["gettgt.py"] = true
L3_1["getuserspns.py"] = true
L3_1["goldenpac.py"] = true
L3_1["karmasmb.py"] = true
L3_1["keylistattack.py"] = true
L3_1["kintercept.py"] = true
L3_1["ldap_shell.py"] = true
L3_1["logger.py"] = true
L3_1["lookupsid.py"] = true
L3_1["machine_role.py"] = true
L3_1["mimikatz.py"] = true
L3_1["mqtt_check.py"] = true
L3_1["mssqlclient.py"] = true
L3_1["mssqlinstance.py"] = true
L3_1["mssqlshell.py"] = true
L3_1["net.py"] = true
L3_1["netview.py"] = true
L3_1["nmapanswermachine.py"] = true
L3_1["ntfs-read.py"] = true
L3_1.ntlmrelayx = true
L3_1["ntlmrelayx.py"] = true
L3_1["os_ident.py"] = true
L3_1["ping.py"] = true
L3_1["ping6.py"] = true
L3_1["psexec.py"] = true
L3_1["raisechild.py"] = true
L3_1["rbcd.py"] = true
L3_1["rdp_check.py"] = true
L3_1["reg.py"] = true
L3_1["registry-read.py"] = true
L3_1["remcomsvc.py"] = true
L3_1["rpcdatabase.py"] = true
L3_1["rpcdump.py"] = true
L3_1["rpcmap.py"] = true
L3_1["sambapipe.py"] = true
L3_1["samrdump.py"] = true
L3_1["secretsdump.py"] = true
L3_1["serviceinstall.py"] = true
L3_1["services.py"] = true
L3_1["smbclient.py"] = true
L3_1["smbexec.py"] = true
L3_1["smbpasswd.py"] = true
L3_1["smbrelayx.py"] = true
L3_1["smbserver.py"] = true
L3_1["sniff.py"] = true
L3_1["sniffer.py"] = true
L3_1["split.py"] = true
L3_1["ticketconverter.py"] = true
L3_1["ticketer.py"] = true
L3_1["tstool.py"] = true
L3_1["wmiexec.py"] = true
L3_1["wmipersist.py"] = true
L4_1 = L3_1[L1_1]
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.set_mpattribute
  L5_1 = "Lua:ImpacketExampleScript!"
  L6_1 = L1_1
  L5_1 = L5_1 .. L6_1
  L4_1(L5_1)
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.set_mpattribute
L5_1 = "Lua:UsesImpacketUnknown"
L4_1(L5_1)
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
