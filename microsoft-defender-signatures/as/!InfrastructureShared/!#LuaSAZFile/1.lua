-- Threat: !InfrastructureShared
-- Name: !#Lua:SAZFile
-- Type: 13
-- MpAttributes: Lua:FileInZip & InO365

local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, "%->raw/%d%d%d_s.txt") then
  mp.set_mpattribute("SCPT:Nemucod_exclusion")
end
return mp.CLEAN
