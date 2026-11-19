-- Threat: !InfrastructureShared
-- Name: 39612b4b011d
-- Type: 21

if peattributes.ismsil == true then
  local l_0_0 = string.lower(mp.getfilename())
  if string.find(l_0_0, ".scr$") or string.find(l_0_0, ".tmp$") then
    return mp.INFECTED
  else
    return mp.LOWFI
  end
end
return mp.CLEAN
