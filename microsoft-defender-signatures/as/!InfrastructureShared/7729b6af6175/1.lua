-- Threat: !InfrastructureShared
-- Name: 7729b6af6175
-- Type: 21

local l_0_0 = mp.getfilename()
if string.find(l_0_0, "word/afchunk.mht") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
