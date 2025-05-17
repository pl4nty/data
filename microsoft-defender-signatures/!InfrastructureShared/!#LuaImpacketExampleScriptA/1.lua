-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaImpacketExampleScriptA\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
l_0_2 = (string.lower)(l_0_2)
;
(mp.set_mpattribute)("Lua:ImpacketAccessBy!" .. l_0_2)
if l_0_0:find("\\site-packages\\", 1, true) or l_0_0:find("\\dist-packages\\", 1, true) then
  (mp.set_mpattribute)("Lua:ImpacketInSitePackages")
end
if l_0_0:find("\\users\\.+\\downloads", 1, true) then
  (mp.set_mpattribute)("Lua:ImpacketInDownloads")
end
local l_0_3 = {}
l_0_3["addcomputer.py"] = true
l_0_3["atexec.py"] = true
l_0_3["changepasswd.py"] = true
l_0_3["dcomexec.py"] = true
l_0_3["dpapi.py"] = true
l_0_3["dumpntlminfo.py"] = true
l_0_3["esentutl.py"] = true
l_0_3["exchanger.py"] = true
l_0_3["finddelegation.py"] = true
l_0_3["get-gpppassword.py"] = true
l_0_3["getadusers.py"] = true
l_0_3["getarch.py"] = true
l_0_3["getnpusers.py"] = true
l_0_3["getpac.py"] = true
l_0_3["getst.py"] = true
l_0_3["gettgt.py"] = true
l_0_3["getuserspns.py"] = true
l_0_3["goldenpac.py"] = true
l_0_3["karmasmb.py"] = true
l_0_3["keylistattack.py"] = true
l_0_3["kintercept.py"] = true
l_0_3["ldap_shell.py"] = true
l_0_3["logger.py"] = true
l_0_3["lookupsid.py"] = true
l_0_3["machine_role.py"] = true
l_0_3["mimikatz.py"] = true
l_0_3["mqtt_check.py"] = true
l_0_3["mssqlclient.py"] = true
l_0_3["mssqlinstance.py"] = true
l_0_3["mssqlshell.py"] = true
l_0_3["net.py"] = true
l_0_3["netview.py"] = true
l_0_3["nmapanswermachine.py"] = true
l_0_3["ntfs-read.py"] = true
l_0_3.ntlmrelayx = true
l_0_3["ntlmrelayx.py"] = true
l_0_3["os_ident.py"] = true
l_0_3["ping.py"] = true
l_0_3["ping6.py"] = true
l_0_3["psexec.py"] = true
l_0_3["raisechild.py"] = true
l_0_3["rbcd.py"] = true
l_0_3["rdp_check.py"] = true
l_0_3["reg.py"] = true
l_0_3["registry-read.py"] = true
l_0_3["remcomsvc.py"] = true
l_0_3["rpcdatabase.py"] = true
l_0_3["rpcdump.py"] = true
l_0_3["rpcmap.py"] = true
l_0_3["sambapipe.py"] = true
l_0_3["samrdump.py"] = true
l_0_3["secretsdump.py"] = true
l_0_3["serviceinstall.py"] = true
l_0_3["services.py"] = true
l_0_3["smbclient.py"] = true
l_0_3["smbexec.py"] = true
l_0_3["smbpasswd.py"] = true
l_0_3["smbrelayx.py"] = true
l_0_3["smbserver.py"] = true
l_0_3["sniff.py"] = true
l_0_3["sniffer.py"] = true
l_0_3["split.py"] = true
l_0_3["ticketconverter.py"] = true
l_0_3["ticketer.py"] = true
l_0_3["tstool.py"] = true
l_0_3["wmiexec.py"] = true
l_0_3["wmipersist.py"] = true
if l_0_3[l_0_1] then
  (mp.set_mpattribute)("Lua:ImpacketExampleScript!" .. l_0_1)
  return mp.INFECTED
end
;
(mp.set_mpattribute)("Lua:UsesImpacketUnknown")
return mp.CLEAN

