-- Threat: !InfrastructureShared
-- Name: !#Lua:HasRansomNoteString
-- Type: 13

local l_0_0 = mp.enum_mpattributesubstring("SCPT:RansomNote:")
if l_0_0 ~= nil and 5 <= #l_0_0 then
  mp.set_mpattribute("MpDisableCaching")
  return mp.INFECTED
end
return mp.CLEAN
