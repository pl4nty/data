-- Threat: !InfrastructureShared
-- Name: 9b7892f9fc6e
-- Type: 21

if peattributes.isexe and peattributes.no_security == false and peattributes.ismsil == false then
  local l_0_0 = mp.getfilesize()
  if 1126400 <= l_0_0 and l_0_0 <= 1945600 then
    return mp.INFECTED
  end
end
return mp.CLEAN
