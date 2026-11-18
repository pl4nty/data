-- Threat: !InfrastructureShared
-- Name: !#EnumPoCExchgGoSource
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & SCPT:GoPkgMainImportCryptoTls

local l_0_0 = mp.enum_mpattributesubstring("SCPT:PoCExchgGoSource")
if 2 <= #l_0_0 then
  mp.set_mpattribute("Lua:PoCExchgGoSourceFrags")
end
return mp.CLEAN
