-- Threat: !InfrastructureShared
-- Name: !#ALF:HackTool:Linux/TestSampleSubmission1.A
-- Type: 13

local l_0_0 = mp.getfilesize()
if l_0_0 ~= 8944 then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)
if l_0_1 ~= "d0d9c610-827c-44f3-b7d2-539b680a8716" then
  return mp.CLEAN
end
return mp.INFECTED
