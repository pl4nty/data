-- Threat: !InfrastructureShared
-- Name: !#Lua:VbaCodeCounter
-- Type: 13
-- Includes: SetAttributeFromClassifierScoresEx
-- MpAttributes: MpVBASourceRoutines & MpVBAPCodeRoutines

local l_0_0 = mp.get_mpattributevalue("MpVBAPCodeRoutines")
if l_0_0 then
  SetAttributeFromClassifierScoresEx(l_0_0, {
    90,
    80,
    70,
    60,
    30,
    20,
    10,
    8,
    4,
    2,
    1,
    0
  }, "Lua:VbaPcodeApproxCount:")
end
local l_0_1 = mp.get_mpattributevalue("MpVBASourceRoutines")
if l_0_1 then
  SetAttributeFromClassifierScoresEx(l_0_1, {
    90,
    80,
    70,
    60,
    30,
    20,
    10,
    8,
    4,
    2,
    1,
    0
  }, "Lua:VbaSourceApproxCount:")
end
if l_0_0 and l_0_1 then
  local l_0_2
  if l_0_0 >= l_0_1 then
    l_0_2 = (l_0_0 - l_0_1) * 100 / (l_0_0 + l_0_1)
  else
    l_0_2 = (l_0_1 - l_0_0) * 100 / (l_0_0 + l_0_1)
  end
  SetAttributeFromClassifierScoresEx(l_0_2, {
    90,
    80,
    70,
    60,
    30,
    20,
    10,
    8,
    4,
    2,
    1,
    0
  }, "Lua:VbaRelativeDiff:")
end
return mp.CLEAN
