-- Threat: !#PUA:Block:FileZilla_BundleInstaller
-- Type: 13
-- MpAttributes: SCPT:FileZillaOfferURL & SCPT:FileZillaOfferString & SCPT:FileZillaReg

local l_0_0, l_0_1 = mp.UfsGetMetadataBool("LUAUFS:NSISFileZillaBndlCert", true)
if l_0_0 == 0 and l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
