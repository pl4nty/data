-- Threat: !InfrastructureShared
-- Name: !#Lua:FeatureRPFEh
-- Type: 12
-- MpAttributes: RPF:TopLevelFile & BM_MZ_FILE

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) ~= true then
  return mp.CLEAN
end
local l_0_1 = mp.GetMOTWZone()
if not l_0_1 or l_0_1 < 3 then
  return mp.CLEAN
end
local l_0_2 = mp.GetCertificateInfo()
if not l_0_2 or next(l_0_2) then
  return mp.CLEAN
end
mp.set_mpattribute("MpInternal_FeatureRPFMsvcEh")
mp.set_mpattributeex("RPF:MSVC:FunctionSizeThreshold", 16384)
mp.set_mpattributeex("RPF:MSVC:FunctionStackThreshold", 1024)
mp.set_mpattribute("MpInternal_FeatureRPFDwarfEh")
mp.set_mpattributeex("RPF:DWARF:FunctionSizeThreshold", 16384)
return mp.CLEAN
