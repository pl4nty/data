-- Threat: !InfrastructureShared
-- Name: !#Lua:Mytonel.F1
-- Type: 10
-- MpAttributes: NID:Mytonel.F1

local l_0_0 = mp.getfilename()
if l_0_0:len() < 14 then
  return mp.CLEAN
end
if l_0_0:sub(-14) ~= "\\pps-qq-19.exe" then
  return mp.CLEAN
end
return mp.INFECTED
