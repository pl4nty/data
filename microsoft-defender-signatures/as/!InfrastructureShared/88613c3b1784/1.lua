-- Threat: !InfrastructureShared
-- Name: 88613c3b1784
-- Type: 21

local l_0_0 = mp.getfilename()
if string.sub(l_0_0, -10) == "->(Upxw64)" then
  mp.set_mpattribute("HSTR:HackTool:Win64/MikatzUPX")
end
return mp.INFECTED
