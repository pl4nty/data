-- Threat: !InfrastructureShared
-- Name: !#VbaProjectSignature
-- Type: 12
-- MpAttributes: !RPF:TopLevelFile

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_0 then
  return mp.CLEAN
end
if string.find(l_0_0, "vbaprojectsignature", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
