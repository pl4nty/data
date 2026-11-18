-- Threat: !InfrastructureShared
-- Name: !#ALF:PUA:WIn32/FileZilla_BundleInstaller
-- Type: 13
-- MpAttributes: SCPT:FileZillaOfferURL & SCPT:FileZillaOfferString & SCPT:FileZillaReg & !PUA:Block:FileZilla_BundleInstaller

local l_0_0, l_0_1 = mp.UfsGetMetadataBool("LUAUFS:NSISHasFileZillaCert", true)
if l_0_0 == 0 and l_0_1 then
  if not mp.get_mpattribute("Lua:IsPUA") then
    mp.set_mpattribute("LUA:FileZilla_BundleInstaller:NonBundleCert")
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
