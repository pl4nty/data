-- Threat: Trojan:AIModel/ReverseShell.A
-- Type: 13
-- MpAttributes: AGGR:PKL/SuspFile_evel_exec

if #mp.enum_mpattributesubstring("SCPT:pyWebShell") >= 4 then
  return mp.INFECTED
end
return mp.CLEAN
