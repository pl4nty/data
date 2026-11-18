-- Threat: !InfrastructureShared
-- Name: 60786961c421
-- Type: 21

if peattributes.isexe and peattributes.no_security and peattributes.isvbnative and peattributes.x86_image then
  local l_0_0 = mp.getfilesize()
  if 35840 < l_0_0 and l_0_0 < 204800 then
    return mp.INFECTED
  end
end
return mp.CLEAN
