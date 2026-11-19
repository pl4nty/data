-- Threat: !InfrastructureShared
-- Name: !#Lua:XzShade.ST4
-- Type: 13
-- MpAttributes: AGGR:XzShade.55594

local l_0_0 = mp.enum_mpattributesubstring("SCRT:TS5559.Dnsdor.")
if 2 <= #l_0_0 and #l_0_0 <= 6 then
  return mp.INFECTED
end
return mp.CLEAN
