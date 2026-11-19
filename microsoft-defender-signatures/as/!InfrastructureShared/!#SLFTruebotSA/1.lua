-- Threat: !InfrastructureShared
-- Name: !#SLF:Truebot.SA
-- Type: 10
-- Includes: LuaFuncHelper
-- MpAttributes: BM_MZ_DLL & RPF:TopLevelFile & PEPCODE:HasDigitalSignature

local l_0_0 = pe.get_versioninfo()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.CompanyName
l_0_1 = l_0_1 and string.lower(l_0_1)
if not StringEndsWith(l_0_1, ",corporation") then
  return mp.CLEAN
end
return mp.INFECTED
