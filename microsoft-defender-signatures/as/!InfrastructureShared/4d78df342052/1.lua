-- Threat: !InfrastructureShared
-- Name: 4d78df342052
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 589824 <= l_0_0 and l_0_0 <= 630784 then
  return mp.INFECTED
end
return mp.CLEAN
