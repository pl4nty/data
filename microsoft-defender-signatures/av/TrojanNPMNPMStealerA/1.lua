-- Threat: Trojan:NPM/NPMStealer.A
-- Type: 13
-- MpAttributes: (SCPT:NpmJS | SCPT:ObsFunc)

if #mp.enum_mpattributesubstring("SCPT:NPMCreds_Stealer_") >= 4 and 4 <= #mp.enum_mpattributesubstring("SCPT:NPMCreds_RegEx_") then
  return mp.INFECTED
end
return mp.CLEAN
