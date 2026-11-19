-- Threat: !InfrastructureShared
-- Name: 1829787aac3f
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") or mp.get_mpattribute("Lua:TopLevelFileExt.A!lnk") then
  return mp.INFECTED
end
return mp.CLEAN
