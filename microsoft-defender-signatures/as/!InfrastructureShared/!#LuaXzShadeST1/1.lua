-- Threat: !InfrastructureShared
-- Name: !#Lua:XzShade.ST1
-- Type: 13
-- MpAttributes: AGGR:XzShade.55591

local l_0_0 = mp.enum_mpattributesubstring("SCRT:TS5559.Dcod2.")
if 2 <= #l_0_0 and #l_0_0 <= 5 then
  return mp.INFECTED
end
return mp.CLEAN
