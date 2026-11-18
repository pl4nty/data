-- Threat: !InfrastructureShared
-- Name: 3a41025ec891
-- Type: 21

if mp.get_mpattribute("MpCPlApplet") then
  return mp.INFECTED
end
return mp.CLEAN
