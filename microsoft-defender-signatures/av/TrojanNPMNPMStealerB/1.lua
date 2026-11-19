-- Threat: Trojan:NPM/NPMStealer.B
-- Type: 13
-- MpAttributes: (SCPT:NpmJS | SCPT:ObsFunc)

local l_0_0 = #mp.enum_mpattributesubstring("SCPT:NPMCreds_Stealer_") or 0
local l_0_1 = #mp.enum_mpattributesubstring("SCPT:NPMCreds_RegEx_") or 0
local l_0_2 = #mp.enum_mpattributesubstring("SCPT:NPMCreds_Env_Printenv") or 0
local l_0_3 = #mp.enum_mpattributesubstring("SCPT:NPMCreds_Meta_") or 0
if (6 <= l_0_0 or 6 <= l_0_1) and (2 <= l_0_2 or 1 <= l_0_3) then
  return mp.INFECTED
end
return mp.CLEAN
