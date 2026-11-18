-- Threat: !InfrastructureShared
-- Name: !#Lua:Vmhost.A
-- Type: 9

local l_0_0 = string.lower(mp.getfilename())
if string.sub(l_0_0, -22) == "\\updatetask\\vmhost.exe" then
  mp.set_mpattribute("Lua:Vmhost.A")
end
return mp.CLEAN
