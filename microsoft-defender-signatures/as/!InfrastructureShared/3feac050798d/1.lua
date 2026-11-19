-- Threat: !InfrastructureShared
-- Name: 3feac050798d
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  local l_0_0 = mp.getfilesize()
  if l_0_0 < 61440 and 57344 < l_0_0 then
    return mp.INFECTED
  end
  return mp.CLEAN
end
return mp.LOWFI
