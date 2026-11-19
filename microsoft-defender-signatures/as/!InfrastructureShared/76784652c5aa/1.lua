-- Threat: !InfrastructureShared
-- Name: 76784652c5aa
-- Type: 21

local l_0_0 = mp.getfilesize()
if 262144 <= l_0_0 and l_0_0 <= 458752 and peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
