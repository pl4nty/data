-- Threat: !InfrastructureShared
-- Name: 4578f1bea41f
-- Type: 21

mp.set_mpattribute("HSTR:VirTool:MSIL/Injector.HZ")
if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.LOWFI
