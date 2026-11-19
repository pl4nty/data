-- Threat: !InfrastructureShared
-- Name: 4540cfe18de6
-- Type: 21

if mp.get_mpattribute("SIGATTR:VirTool:BattleNetWipe") then
  return mp.INFECTED
end
return mp.CLEAN
