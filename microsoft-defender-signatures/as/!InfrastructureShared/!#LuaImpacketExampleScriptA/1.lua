-- Threat: !InfrastructureShared
-- Name: !#Lua:ImpacketExampleScript.A
-- Type: 12
-- MpAttributes: (Nscript:Type_py | BM_PY_FILE) & (SCPT:FromImpacket | SCPT:ImportImpacket)

local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
l_0_2 = string.lower(l_0_2)
mp.set_mpattribute("Lua:ImpacketAccessBy!" .. l_0_2)
if l_0_0:find("\\site-packages\\", 1, true) or l_0_0:find("\\dist-packages\\", 1, true) then
  mp.set_mpattribute("Lua:ImpacketInSitePackages")
end
if l_0_0:find("\\users\\.+\\downloads", 1, true) then
  mp.set_mpattribute("Lua:ImpacketInDownloads")
end
local l_0_3 = {
  ["addcomputer.py"] = true,
  ["atexec.py"] = true,
  ["changepasswd.py"] = true,
  ["dcomexec.py"] = true,
  ["dpapi.py"] = true,
  ["dumpntlminfo.py"] = true,
  ["esentutl.py"] = true,
  ["exchanger.py"] = true,
  ["finddelegation.py"] = true,
  ["get-gpppassword.py"] = true,
  ["getadusers.py"] = true,
  ["getarch.py"] = true,
  ["getnpusers.py"] = true,
  ["getpac.py"] = true,
  ["getst.py"] = true,
  ["gettgt.py"] = true,
  ["getuserspns.py"] = true,
  ["goldenpac.py"] = true,
  ["karmasmb.py"] = true,
  ["keylistattack.py"] = true,
  ["kintercept.py"] = true,
  ["ldap_shell.py"] = true,
  ["logger.py"] = true,
  ["lookupsid.py"] = true,
  ["machine_role.py"] = true,
  ["mimikatz.py"] = true,
  ["mqtt_check.py"] = true,
  ["mssqlclient.py"] = true,
  ["mssqlinstance.py"] = true,
  ["mssqlshell.py"] = true,
  ["net.py"] = true,
  ["netview.py"] = true,
  ["nmapanswermachine.py"] = true,
  ["ntfs-read.py"] = true,
  ntlmrelayx = true,
  ["ntlmrelayx.py"] = true,
  ["os_ident.py"] = true,
  ["ping.py"] = true,
  ["ping6.py"] = true,
  ["psexec.py"] = true,
  ["raisechild.py"] = true,
  ["rbcd.py"] = true,
  ["rdp_check.py"] = true,
  ["reg.py"] = true,
  ["registry-read.py"] = true,
  ["remcomsvc.py"] = true,
  ["rpcdatabase.py"] = true,
  ["rpcdump.py"] = true,
  ["rpcmap.py"] = true,
  ["sambapipe.py"] = true,
  ["samrdump.py"] = true,
  ["secretsdump.py"] = true,
  ["serviceinstall.py"] = true,
  ["services.py"] = true,
  ["smbclient.py"] = true,
  ["smbexec.py"] = true,
  ["smbpasswd.py"] = true,
  ["smbrelayx.py"] = true,
  ["smbserver.py"] = true,
  ["sniff.py"] = true,
  ["sniffer.py"] = true,
  ["split.py"] = true,
  ["ticketconverter.py"] = true,
  ["ticketer.py"] = true,
  ["tstool.py"] = true,
  ["wmiexec.py"] = true,
  ["wmipersist.py"] = true
}
if l_0_3[l_0_1] then
  mp.set_mpattribute("Lua:ImpacketExampleScript!" .. l_0_1)
  return mp.INFECTED
end
mp.set_mpattribute("Lua:UsesImpacketUnknown")
return mp.CLEAN
