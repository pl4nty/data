-- Threat: !InfrastructureShared
-- Name: 2a299e8e3dd6
-- Type: 21

if not mp.get_mpattribute("//AGGR:OleFile") and not mp.get_mpattribute("Lua:FileSizeLT2000") then
  return mp.CLEAN
end
local l_0_0 = string.lower(tostring(headerpage))
local l_0_1, l_0_2, l_0_3 = string.find(l_0_0, "(<a href%=\"http%://.-\">http%://mail%.vodafone%.co%.uk/)")
if nil == l_0_3 then
  return mp.CLEAN
end
if nil == string.match(l_0_3, "<a href%=\"http%://mail%.vodafone%.co%.uk/.-\">http%://mail%.vodafone%.co%.uk/") then
  return mp.INFECTED
end
return mp.CLEAN
