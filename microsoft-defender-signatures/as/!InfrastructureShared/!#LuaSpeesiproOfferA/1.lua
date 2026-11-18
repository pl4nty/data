-- Threat: !InfrastructureShared
-- Name: !#Lua:SpeesiproOffer.A
-- Type: 8
-- MpAttributes: RPF:TopLevelFile

local l_0_0
l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_LOWERCASE, mp.FILEPATH_QUERY_FULL))
if l_0_0 ~= nil and string.find(l_0_0, "\\programdata\\.+\\offers\\.+%.exe", 1, false) then
  mp.set_mpattribute("Lua:SpeesiproOffer.A")
end
return mp.CLEAN
