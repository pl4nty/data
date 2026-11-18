-- Threat: !InfrastructureShared
-- Name: !#Lua:XzShade.ST2
-- Type: 13
-- MpAttributes: AGGR:XzShade.55592

local l_0_0 = mp.enum_mpattributesubstring("SCRT:TS5559.Lodenv.")
if 4 <= #l_0_0 and #l_0_0 <= 9 then
  return mp.INFECTED
end
return mp.CLEAN
