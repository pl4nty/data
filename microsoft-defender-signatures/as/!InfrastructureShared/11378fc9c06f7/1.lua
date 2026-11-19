-- Threat: !InfrastructureShared
-- Name: 11378fc9c06f7
-- Type: 21

local l_0_0 = mp.getfilename()
if string.sub(l_0_0, -10) == "->(Upxw64)" then
  return mp.INFECTED
end
return mp.CLEAN
