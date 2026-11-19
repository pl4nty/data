-- Threat: !InfrastructureShared
-- Name: !#QakbotURLFeatureExtraction
-- Type: 13
-- MpAttributes: ((SCPT:PSEnvTemp | SCRIPT:Rundll32 | PowerShell:Start-Sleep) & (PowerShell:Get-Item | SCPT:PsLoop | SCPT:VBSSplit))

local l_0_0 = {}
local l_0_1 = 0
local l_0_2 = tostring(headerpage) .. tostring(footerpage)
if l_0_2 ~= nil then
  for l_0_3 in string.gmatch(l_0_2, "(https?://[-a-zA-Z0-9@:%._/+~#=]*)") do
    if l_0_3 ~= nil and not l_0_0[l_0_3] then
      l_0_1 = l_0_1 + 1
      mp.set_mpattribute("MpInternal_researchdata=powershelluri=" .. l_0_3)
      l_0_0[l_0_3] = true
    end
  end
end
if 8 < l_0_1 then
  mp.set_mpattribute("Found:" .. l_0_1 .. "urls")
  mp.set_mpattribute("GE8URLsFound")
elseif 2 < l_0_1 then
  mp.set_mpattribute("Found:" .. l_0_1 .. "urls")
  mp.set_mpattribute("GE3URLsFound")
end
return mp.CLEAN
