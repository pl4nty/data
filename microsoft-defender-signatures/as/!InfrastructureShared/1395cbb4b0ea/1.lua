-- Threat: !InfrastructureShared
-- Name: 1395cbb4b0ea
-- Type: 21

if not pe.isdynamic_va(pevars.sigaddr) then
  return mp.CLEAN
end
if not mp.get_mpattribute("PEBMPAT:Virus:Win32/Xpaj.gen!F") then
  return mp.CLEAN
end
return mp.INFECTED
