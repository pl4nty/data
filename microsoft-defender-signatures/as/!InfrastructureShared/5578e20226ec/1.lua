-- Threat: !InfrastructureShared
-- Name: 5578e20226ec
-- Type: 21

mp.set_mpattribute("HSTR:VirTool:MSIL/Injector.IA")
if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.LOWFI
