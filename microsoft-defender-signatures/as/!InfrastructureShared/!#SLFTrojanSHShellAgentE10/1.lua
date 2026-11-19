-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:SH/ShellAgent.E10
-- Type: 13
-- MpAttributes: (SCPT:SuspiciousShell_mdatp_rtp_disable | SCPT:SuspiciousShell_mdatp_cloud_disable | SCPT:SuspiciousShell_mdatp_rtp_passive | SCPT:SuspiciousShell_carbonblack_removal_1 | SCPT:SuspiciousShell_carbonblack_removal_2 | SCPT:SuspiciousShell_carbonblack_removal_3)

local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or l_0_1 == "" or l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_2 = "/var/lib/waagent/run-command/download/"
if l_0_1 == "script.sh" and l_0_0:sub(1, #l_0_2) == l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
