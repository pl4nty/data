-- Threat: !InfrastructureShared
-- Name: !#TrojanDownloader:VBS/Bladabindi.A!Lowfi
-- Type: 13

if mp.get_mpattribute("//LOWFI:LUA:Bladabindi") == true then
  return mp.LOWFI
end
return mp.CLEAN
