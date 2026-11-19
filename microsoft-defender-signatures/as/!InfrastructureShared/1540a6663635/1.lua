-- Threat: !InfrastructureShared
-- Name: 1540a6663635
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if string.sub(l_0_0, -16) == "skypelogview.exe" then
  return mp.CLEAN
end
return mp.LOWFI
