-- Threat: !InfrastructureShared
-- Name: !#Lua:Modvino.ST1
-- Type: 13
-- MpAttributes: AGGR:TS5467.S1

local l_0_0 = mp.enum_mpattributesubstring("SCRT:TS5467.")
if 2 < #l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
