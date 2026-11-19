-- Threat: VirTool:Script/MassTampering.SC
-- Type: 13
-- MpAttributes: SCPT:privacy_sexy

if #mp.enum_mpattributesubstring("SCPT:privacy_sexy_comments") >= 20 then
  return mp.INFECTED
end
return mp.CLEAN
