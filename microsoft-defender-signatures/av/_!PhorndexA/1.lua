-- Threat: \xac!Phorndex.A
-- Type: 13
-- MpAttributes: SCPT:Trojan:Phorndex & Lua:InnoScript

local l_0_0, l_0_1 = mp.UfsGetMetadataBool("LUAUFS:HasPhorndexCert", true)
if l_0_0 == 0 and l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
