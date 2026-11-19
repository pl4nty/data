-- Threat: !InfrastructureShared
-- Name: !#Lua:PuaSubstringAttributeMatched
-- Type: 24

if mp.get_mpattributesubstring("PUA:") then
  return mp.INFECTED
end
return mp.CLEAN
