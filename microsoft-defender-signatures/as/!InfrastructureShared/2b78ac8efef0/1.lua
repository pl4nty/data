-- Threat: !InfrastructureShared
-- Name: 2b78ac8efef0
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security and 290816 < l_0_0 and l_0_0 < 589824 then
  return mp.INFECTED
end
return mp.CLEAN
