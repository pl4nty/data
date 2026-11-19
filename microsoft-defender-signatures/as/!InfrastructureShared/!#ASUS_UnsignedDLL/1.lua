-- Threat: !InfrastructureShared
-- Name: !#ASUS_UnsignedDLL
-- Type: 10
-- MpAttributes: AGGR:UnsignedDLLInArchive | InvalidSignedDLLInArchive

local l_0_0 = mp.getfilename()
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if string.find(l_0_0, "loc.dll", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
