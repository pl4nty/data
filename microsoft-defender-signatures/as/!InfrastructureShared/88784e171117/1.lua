-- Threat: !InfrastructureShared
-- Name: 88784e171117
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if mp.getfilesize() < 1000000 and string.sub(l_0_0, -12) == "goopdate.dll" then
  return mp.INFECTED
end
return mp.CLEAN
