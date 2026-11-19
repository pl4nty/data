-- Threat: \xac\xa1GhStealer.Z!MTB
-- Type: 13
-- MpAttributes: SCRIPT:JS/Dasbase64.A

if #mp.enum_mpattributesubstring("NPMCreds_Cred_") >= 2 and 2 <= #mp.enum_mpattributesubstring("SCPT:NPMCreds_Token_") and 2 <= #mp.enum_mpattributesubstring("SCPT:NPMCreds_Env_Printenv") and #mp.enum_mpattributesubstring("SCPT:NPMCreds_Meta_") >= 1 then
  return mp.INFECTED
end
return mp.CLEAN
