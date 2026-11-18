-- Threat: !InfrastructureShared
-- Name: 7540243d52e3
-- Type: 21

if not peattributes.isdll then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)
if string.find(l_0_0:lower(), "microsoft.net\\framework.-\\v[0-9.].+\\temporary asp.net files\\") then
  return mp.INFECTED
end
return mp.CLEAN
