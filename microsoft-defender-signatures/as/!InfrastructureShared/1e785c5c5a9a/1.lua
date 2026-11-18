-- Threat: !InfrastructureShared
-- Name: 1e785c5c5a9a
-- Type: 21

mp.set_mpattribute("HSTR:VirTool:MSIL/Injector.GM")
if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.LOWFI
