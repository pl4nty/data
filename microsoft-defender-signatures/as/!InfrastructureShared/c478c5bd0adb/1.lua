-- Threat: !InfrastructureShared
-- Name: c478c5bd0adb
-- Type: 21

local l_0_0 = mp.getfilesize()
if 151552 <= l_0_0 and l_0_0 <= 307200 then
  return mp.INFECTED
end
return mp.CLEAN
