-- Threat: !InfrastructureShared
-- Name: e28f873bd3f
-- Type: 21

if mp.get_mpattribute("LowFiJSChildFileHasIOAVURL") then
  local l_0_0 = string.lower(mp.getfilename())
  if l_0_0 == nil then
    return mp.CLEAN
  end
  if string.match(l_0_0, "edge") ~= nil or string.match(l_0_0, "chrome") ~= nil or string.match(l_0_0, "firefox") ~= nil or string.match(l_0_0, "download") ~= nil then
    return mp.INFECTED
  end
  return mp.LOWFI
end
return mp.CLEAN
