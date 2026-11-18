-- Threat: !InfrastructureShared
-- Name: 9178f573d687
-- Type: 21

if peattributes.ismsil == true then
  local l_0_0 = mp.getfilesize()
  if l_0_0 < 153600 then
    return mp.INFECTED
  end
end
return mp.CLEAN
