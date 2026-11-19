-- Threat: !InfrastructureShared
-- Name: 7129f37bc213
-- Type: 21

local l_0_0 = mp.getfilename()
if string.find(l_0_0, "odbior_1000%d%d%d%d%d%d%d%d%dU.vbs") ~= nil or string.find(l_0_0, "przesylka_1000%d%d%d%d%d%d%d%d%dU.vbs") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
