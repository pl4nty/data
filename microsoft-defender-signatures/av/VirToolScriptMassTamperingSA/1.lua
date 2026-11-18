-- Threat: VirTool:Script/MassTampering.SA
-- Type: 13
-- MpAttributes: (MpIsPowerShellAMSIScan | Lua:PS1Ext)

if #mp.enum_mpattributesubstring("SCPT:DisableRTP.STB") >= 5 then
  return mp.INFECTED
end
return mp.CLEAN
