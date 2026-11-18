-- Threat: !InfrastructureShared
-- Name: b941807ea363
-- Type: 21

if mp.get_mpattribute("MpCPlApplet") then
  return mp.INFECTED
end
return mp.CLEAN
