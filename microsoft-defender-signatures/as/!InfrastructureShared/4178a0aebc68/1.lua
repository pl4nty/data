-- Threat: !InfrastructureShared
-- Name: 4178a0aebc68
-- Type: 21

if peattributes.isexe then
  local l_0_0 = mp.getfilesize()
  if 2048000 < l_0_0 then
    return mp.INFECTED
  elseif l_0_0 < 921600 then
    return mp.LOWFI
  end
end
return mp.CLEAN
