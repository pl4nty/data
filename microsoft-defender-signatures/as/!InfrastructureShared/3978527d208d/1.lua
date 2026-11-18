-- Threat: !InfrastructureShared
-- Name: 3978527d208d
-- Type: 21

mp.set_mpattribute("HSTR:VirTool:MSIL/Injector.IC")
if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.LOWFI
