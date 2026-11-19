-- Threat: !InfrastructureShared
-- Name: !#Lua:FakePAVVBSFileName
-- Type: 13

local l_0_0 = string.lower(mp.getfilename())
if string.sub(l_0_0, -12) == "\\temp\\tl.vbs" then
  mp.set_mpattribute("Lua:FakePAVVBSFileName.A")
end
return mp.CLEAN
