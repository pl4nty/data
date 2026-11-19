-- Threat: !InfrastructureShared
-- Name: !#LUA:GACBinDrop
-- Type: 10
-- MpAttributes: RPF:TopLevelFile & BM_MZ_FILE & (!PEPCODE:HasDigitalSignature)

if mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) ~= true then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)
if l_0_0 ~= "" and string.find(l_0_0, "\\windows\\microsoft.net\\assembly\\gac_msil\\", 1, true) then
  local l_0_1 = mp.GetCertificateInfo()
  for l_0_2, l_0_3 in pairs(l_0_1) do
    if l_0_3.Signers == nil then
      mp.set_mpattribute("Lua:GACUnsignedBinDrop")
    end
  end
end
return mp.CLEAN
