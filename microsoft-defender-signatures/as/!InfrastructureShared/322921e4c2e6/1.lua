-- Threat: !InfrastructureShared
-- Name: 322921e4c2e6
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") or mp.get_mpattribute("Lua:TopLevelFileExt.A!lnk") then
  return mp.INFECTED
end
return mp.CLEAN
