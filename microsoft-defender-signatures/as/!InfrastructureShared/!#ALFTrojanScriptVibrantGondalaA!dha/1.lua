-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Script/VibrantGondala.A!dha
-- Type: 24
-- MpAttributes: (AGGR:VibrantGondala)

if mp.get_mpattribute("AGGR:VibrantGondala") then
  mp.set_mpattribute("MpNonPIIFileType")
  return mp.INFECTED
end
return mp.CLEAN
