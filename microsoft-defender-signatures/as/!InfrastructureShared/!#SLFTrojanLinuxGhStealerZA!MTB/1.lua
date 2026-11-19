-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Linux/GhStealer.ZA!MTB
-- Type: 13
-- MpAttributes: SCRIPT:JS/Dasbase64.A

if #mp.enum_mpattributesubstring("NPMCreds_Cred_") >= 1 and 1 <= #mp.enum_mpattributesubstring("SCPT:NPMCreds_Token_") and 1 <= #mp.enum_mpattributesubstring("SCPT:NPMCreds_Env_Printenv") then
  return mp.INFECTED
end
return mp.CLEAN
