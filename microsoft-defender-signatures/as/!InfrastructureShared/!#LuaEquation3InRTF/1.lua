-- Threat: !InfrastructureShared
-- Name: !#Lua:Equation3InRTF
-- Type: 13
-- MpAttributes: SCPT:OLE.Equation3.A

local l_0_0 = mp.getfilename()
if string.find(l_0_0, "->(Rtf", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
