-- Threat: !InfrastructureShared
-- Name: 25b3ba99098a
-- Type: 21

local l_0_0 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
if l_0_0 and (string.find(l_0_0, "c:\\users\\", 1, true) or string.find(l_0_0, "c:\\programdata\\", 1, true)) then
  return mp.INFECTED
end
return mp.CLEAN
