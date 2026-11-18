-- Threat: !InfrastructureShared
-- Name: 2f29b4685c78
-- Type: 21

if mp.get_mpattribute("Lua:MDExt") or mp.get_mpattribute("Exception:Perhetshell.Pra1") or mp.get_mpattribute("implicit:filenameEQpentest.md") then
  return mp.CLEAN
end
return mp.INFECTED
