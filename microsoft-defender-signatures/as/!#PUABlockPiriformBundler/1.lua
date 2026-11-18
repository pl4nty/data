-- Threat: !#PUA:Block:PiriformBundler
-- Type: 13
-- MpAttributes: SCPT:PiriformBundleName & SCPT:CCleanerPing & SCPT:PiriformReg

local l_0_0, l_0_1 = mp.UfsGetMetadataBool("LUAUFS:NSISHasPiriformCert", true)
if l_0_0 == 0 and l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
