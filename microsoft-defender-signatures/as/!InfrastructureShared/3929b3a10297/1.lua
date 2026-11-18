-- Threat: !InfrastructureShared
-- Name: 3929b3a10297
-- Type: 21

local l_0_0 = mp.getfilename()
if string.find(l_0_0, "->[XLMSharedStrings]", -20, true) ~= nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetNormalizedScript(true)
local l_0_2
l_0_1, l_0_2 = string.gsub(l_0_1, "\"&amp;\"", "")
if 3 < l_0_2 then
  mp.vfo_add_buffer(l_0_1, "[XLMSharedStrings]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
  return mp.INFECTED
end
return mp.CLEAN
