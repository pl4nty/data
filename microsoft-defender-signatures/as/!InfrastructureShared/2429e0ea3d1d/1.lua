-- Threat: !InfrastructureShared
-- Name: 2429e0ea3d1d
-- Type: 21

if not mp.get_mpattribute("//AGGR:OleFile") and not mp.get_mpattribute("Lua:FileSizeLT2000") then
  return mp.CLEAN
end
local l_0_0 = string.lower(tostring(headerpage))
local l_0_1, l_0_2, l_0_3 = string.find(l_0_0, "(<a href%=\"http%://.-\">https%://dhl24%.com%.uk/)")
if nil == l_0_3 then
  return mp.CLEAN
end
if nil == string.match(l_0_3, "<a href%=\"https%://dhl24%.com%.uk/.-\">https%://dhl24%.com%.uk/") then
  return mp.INFECTED
end
return mp.CLEAN
