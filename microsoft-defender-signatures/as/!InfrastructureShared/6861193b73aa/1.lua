-- Threat: !InfrastructureShared
-- Name: 6861193b73aa
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.isvbnative and 765952 <= l_0_0 and l_0_0 <= 872448 then
  return mp.INFECTED
end
return mp.CLEAN
