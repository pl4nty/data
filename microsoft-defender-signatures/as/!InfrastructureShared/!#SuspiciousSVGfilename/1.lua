-- Threat: !InfrastructureShared
-- Name: !#SuspiciousSVGfilename
-- Type: 13
-- MpAttributes: LUA:SVGExt

local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, "%.jpg%.svg") ~= nil or string.find(l_0_0, "%d%d%d%d%d%d%d%d%d%d%d%-%(%d%d%)%.svg") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
