-- Threat: !InfrastructureShared
-- Name: !#Lua:XzShade.ST3
-- Type: 13
-- MpAttributes: AGGR:XzShade.55593

local l_0_0 = mp.enum_mpattributesubstring("SCRT:TS5559.Lodpl.")
if 3 <= #l_0_0 and #l_0_0 <= 5 then
  return mp.INFECTED
end
return mp.CLEAN
