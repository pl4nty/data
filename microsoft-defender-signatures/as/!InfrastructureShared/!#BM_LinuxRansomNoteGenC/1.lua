-- Threat: !InfrastructureShared
-- Name: !#BM_LinuxRansomNote:Gen.C
-- Type: 13
-- MpAttributes: BM_RansomNote:Gen.C

local l_0_0 = mp.enum_mpattributesubstring("SCPT:LinuxClnWordsCat1")
if 0 < #l_0_0 then
  return mp.CLEAN
end
mp.set_mpattribute("MpDisableCaching")
return mp.INFECTED
